//
//  PomodoroAppTests.swift
//  PomodoroAppTests
//
//  Created by Roberto Evangelista on 02/11/24.
//

import ComposableArchitecture
import XCTest

@testable import Pomodoro

final class PomodoroAppTests: XCTestCase {
    func test_startButtonTapped() async throws {
        let sut = await TestStore(
            initialState: PomodoroReducer.State()
        ) {
            PomodoroReducer()
        }

        await sut.send(.startButtonTapped) {
            $0.isTimerRunning = true
        }

        await sut.send(.pauseButtonTapped) {
            $0.isTimerRunning = false
        }
    }

    func test_pauseButtonTapped() async throws {
        let sut = await TestStore(
            initialState: PomodoroReducer.State()
        ) {
            PomodoroReducer()
        }

        await sut.send(.pauseButtonTapped) {
            $0.isTimerRunning = false
        }
    }
}
