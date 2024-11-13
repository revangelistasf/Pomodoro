//
//  PomodoroReducer.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 02/11/24.
//

import ComposableArchitecture
import Foundation

struct PomodoroReducer: Reducer {
    @Dependency(\.continuousClock) var clock

    @ObservableState
    struct State: Equatable {
        let pomodoroMinutesDuration: Int = 25

        var pomodoroSecondsDuration: Int {
            3
            //            pomodoroMinutesDuration * 60
        }

        var isTimerRunning = false
        var secondsElapsed: TimeInterval = 0

        let formatter = PomodoroFormatter()
        var timer: String {
            formatter.format(seconds: secondsElapsed)
        }
    }

    enum Action: Equatable {
        case onAppear
        case startTapped
        case pauseTapped
        case stopTapped
        case timerTicked
    }

    var body: some ReducerOf<PomodoroReducer> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                state.secondsElapsed = Double(state.pomodoroSecondsDuration)
                return .none

            case .startTapped:
                state.isTimerRunning = true
                return .run { send in
                    for await _ in clock.timer(interval: .seconds(1)) {
                        await send(.timerTicked)
                    }
                }
                .cancellable(id: CancelID.timer)

            case .pauseTapped:
                state.isTimerRunning = false
                return .cancel(id: CancelID.timer)

            case .stopTapped:
                state.isTimerRunning = false
                state.secondsElapsed = 0
                return .cancel(id: CancelID.timer)

            case .timerTicked:
                state.secondsElapsed -= 1

                if state.secondsElapsed == 0 {
                    // TODO: - Next Task on List / Break
                    return .send(.stopTapped)
                }
                return .none
            }
        }
    }
}

// MARK: - Cancellables
private enum CancelID: Hashable {
    case timer
}
