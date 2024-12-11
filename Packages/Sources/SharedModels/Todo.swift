//
//  Todo.swift
//  Main
//
//  Created by Roberto Evangelista on 11/12/2024.
//

import Foundation

struct Todo {
	var type: TaskType
	var title: String

	var time: Date? {
		switch type {
		case .todo:
			return self.estimatedCompletion
		case .done:
			return self.finishedAt
		}
	}
	// Only used when task is todo
	var estimatedCompletion: Date?
	var repeatedTimes: Int = 1

	// Only used when task is done
	var finishedAt: Date? = nil
	var taskLength: TimeInterval? = nil

	enum TaskType {
		case todo, done
	}
}
