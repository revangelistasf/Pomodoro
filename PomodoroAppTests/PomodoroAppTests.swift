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

	let clock = TestClock()

	func test_toggleTimer() async throws {
		let sut = await makeSUT()
		let defaultMinutesPomodoroDuration: Double = 25.0
		let defaultPomodoroTimer = defaultMinutesPomodoroDuration * 60 // Timer in seconds.

		await sut.send(.onAppear) {
			$0.secondsElapsed = defaultPomodoroTimer
		}

		await sut.send(.startTapped) {
			$0.isTimerRunning = true
		}

		await clock.advance(by: .seconds(3))

		await sut.receive(.timerTicked) { $0.secondsElapsed = defaultPomodoroTimer - 1 }
		await sut.receive(.timerTicked) { $0.secondsElapsed = defaultPomodoroTimer - 2 }
		await sut.receive(.timerTicked) { $0.secondsElapsed = defaultPomodoroTimer - 3 }

		await sut.send(.pauseTapped) {
			$0.isTimerRunning = false
		}
	}
	
}

// MARK: - Helpers
extension PomodoroAppTests {
    private func makeSUT() async -> TestStoreOf<PomodoroReducer> {
        await TestStore(
            initialState: PomodoroReducer.State()
        ) {
            PomodoroReducer()
        } withDependencies: {
            $0.continuousClock = clock
        }
    }
}
