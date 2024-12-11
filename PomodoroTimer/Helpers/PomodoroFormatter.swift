//
//  PomodoroFormatter.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 09/11/24.
//
import Foundation

struct PomodoroFormatter: Equatable {
    let formatter: DateComponentsFormatter

    init() {
        self.formatter = DateComponentsFormatter()
        self.formatter.unitsStyle = .positional
        self.formatter.allowedUnits = [.minute, .second]
        self.formatter.zeroFormattingBehavior = .pad
    }

    func format(seconds: TimeInterval) -> String {
        return formatter.string(from: seconds) ?? "00:00"
    }
}
