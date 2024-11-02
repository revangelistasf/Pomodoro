//
//  PomodoroReducer.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 02/11/24.
//

import ComposableArchitecture

struct Pomodoro: Reducer {

    @ObservableState
    struct State: Equatable {
        var isTimerRunning = false
    }

    enum Action: Equatable {
        case startButtonTapped
        case pauseButtonTapped
        case stopButtonTapped
    }

    var body: some ReducerOf<Pomodoro> {
        Reduce { state, action in
            switch action {
            case .startButtonTapped:
                state.isTimerRunning = true
                return .none

            case .pauseButtonTapped:
                state.isTimerRunning = false
                return .none

            default: return .none
            }
        }
    }
}
