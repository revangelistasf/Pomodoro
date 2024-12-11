//
//  TaskItem.swift
//  Main
//
//  Created by Roberto Evangelista on 11/12/2024.
//


//
//  Untitled.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 23/11/2024.
//

import SwiftUI

struct TaskItem: View {
	let type: TaskItemType

	var body: some View {
		HStack {
			Text("Very Very Very Very Very Very  long name")
				.lineLimit(2)
			Spacer()
			acessoryItems

		}
		.padding()
		.clipShape(.buttonBorder)
		.frame(maxHeight: .cellMaxHeight)
		.border(.black)
	}

	var acessoryItems: some View {
		HStack {
			Text("00:00")
			
			acessoryItemByType

			Button(action: { }) {
				Image(systemName: "ellipsis")
					.imageScale(.large)
					.frame(width: .iconSize, height: .iconSize)
			}
		}
	}

	@ViewBuilder
	var acessoryItemByType: some View {
		switch type {
		case .todo:
			Text("x2")
				.frame(width: .iconSize, height: .iconSize)
				.border(.black)

		case .done:
			// TODO: - Maybe change it in the future for slide cell action
			Button(action: { }) {
				Image(systemName: "arrow.clockwise")
					.imageScale(.large)
					.frame(width: .iconSize, height: .iconSize)
			}
		}
	}
}

// MARK: - Constants
private extension CGFloat {
	static let cellMaxHeight: Self = 75
	static let iconSize: Self = 48
}

// TODO: - Move this to model later
extension TaskItem {
	enum TaskItemType {
		case todo, done
	}
}

// MARK: - Preview
#Preview {
	VStack {
		TaskItem(type: .todo)
		TaskItem(type: .done)
	}
}
