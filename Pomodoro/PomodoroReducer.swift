//
//  PomodoroReducer.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 02/11/24.
//

import ComposableArchitecture
import Foundation

struct PomodoroReducer: Reducer {

    @ObservableState
    struct State: Equatable {
		// TODO: - Check how I can create a init for this variable because user will be able to custom this.
        var pomodoroMinutesDuration: Int = 25

        var pomodoroSecondsDuration: TimeInterval {
			Double(pomodoroMinutesDuration) * 60
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

	@Dependency(\.continuousClock) var clock

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
                state.secondsElapsed = Double(state.pomodoroSecondsDuration)
                return .cancel(id: CancelID.timer)

            case .timerTicked:
                state.secondsElapsed -= 1

                if state.secondsElapsed == 0 {
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
