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
		.frame(maxHeight: 75)
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

private extension CGFloat {
	static let iconSize: Self = 48
}


extension TaskItem {
	enum TaskItemType {
		case todo, done
	}
}

#Preview {
	VStack {
		TaskItem(type: .todo)
		TaskItem(type: .done)
	}
}