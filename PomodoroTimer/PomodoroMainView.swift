//
//  MainView.swift
//  Pomodoro
//
//  Created by revangelista on 30/04/2024.
//

import SwiftUI

struct PomodoroMainView: View {
    let store: StoreOf<PomodoroReducer>

    var body: some View {
		NavigationStack {
			ScrollView {
				timerView

				todoView

				finishedTasksView

				Spacer()
			}
			.toolbar {
				ToolbarItem(placement: .topBarTrailing) {
					Button {

					} label: {
						Text("Add Task")
					}

				}
			}
		}
    }

    private var timerView: some View {
		VStack(spacing: 12) {
            Text("Name of the task")
				.font(.title)

            Text(store.timer)
				.font(.system(size: 50))

            HStack(spacing: 24) {
				// TODO: - Improve this to usage of "Start" and "Resume"/"Pause". "Stop"/"Done"
                Button { store.send(store.isTimerRunning == false ? .startTapped : .pauseTapped) }
                label: {
                    Text(store.isTimerRunning == false ? "Start" : "Pause")
                        .font(.title)
						.frame(maxWidth: .infinity)
                }
                .buttonStyle(TimerButtonStyle())

                Button { store.send(.stopTapped) }
                label: {
                    Text("Stop")
                        .font(.title)
						.frame(maxWidth: .infinity)
                }
                .buttonStyle(TimerButtonStyle())
            }
        }
        .onAppear { store.send(.onAppear) }
		.padding()
        .frame(maxWidth: .infinity)
		.background(Color.red.ignoresSafeArea())
    }

	// TODO: - Create View Component for Todo Tasks List
    private var todoView: some View {
		VStack {
			DividerWithText(texts: formatTodoHeaderText(tasksRemaining: 4, taskTime: "1h 40m", restTime: "35m"))
			VStack {
				TaskItem(type: .todo)
				TaskItem(type: .todo)
				TaskItem(type: .todo)
			}
			.padding(.horizontal)
		}
    }

	// TODO: - Create View Component for Finished Tasks List
    private var finishedTasksView: some View {
		VStack {
			DividerWithText(texts: ["Done: 1", "25 m"])
			VStack {
				TaskItem(type: .done)
				TaskItem(type: .done)
			}
			.padding(.horizontal)
		}
    }

	// MARK: - Helper
	private func formatTodoHeaderText(
		tasksRemaining: Int,
		taskTime: String,
		restTime: String
	) -> [String] {
		return [
			"TODO: \(tasksRemaining)",
			"Task Time: \(taskTime)",
			"Rest Time: \(restTime)"
		]
	}
}

#Preview {
    PomodoroMainView(
        store: .init(
            initialState: PomodoroReducer.State(),
            reducer: { PomodoroReducer() }
        )
    )
}
