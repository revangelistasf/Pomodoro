//
//  PomodoroApp.swift
//  Pomodoro
//
//  Created by revangelista on 30/04/2024.
//

import SwiftUI

@main
struct PomodoroApp: App {
    var body: some Scene {
        WindowGroup {
            if isProduction {
                PomodoroMainView(
                    store: .init(
                        initialState: PomodoroReducer.State(),
                        reducer: { PomodoroReducer()._printChanges() }
                    )
                )
            }
        }
    }

    private var isProduction: Bool {
        NSClassFromString("XCTestCase") == nil
    }
}
