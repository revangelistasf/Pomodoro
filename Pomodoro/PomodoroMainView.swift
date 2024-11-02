//
//  MainView.swift
//  Pomodoro
//
//  Created by revangelista on 30/04/2024.
//

import ComposableArchitecture
import SwiftUI

struct PomodoroMainView: View {
    let store: StoreOf<PomodoroReducer>

    var body: some View {
        VStack {
            timerView

            todoView

            finishedTasksView

            Spacer()
        }
    }

    private var timerView: some View {
        VStack {
            Text("Name of the task")

            Text("25:00")
                .font(.largeTitle)

            HStack(spacing: 24) {
                Button { store.send(store.isTimerRunning == false ? .startButtonTapped : .pauseButtonTapped) }
                label: {
                    Text(store.isTimerRunning == false ? "Start" : "Pause")
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)

                Button { }
                label: {
                    Text("Stop")
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background(Color.red)
        .clipShape(.buttonBorder)
        .padding()
    }

    private var todoView: some View {
        EmptyView()
    }

    private var finishedTasksView: some View {
        EmptyView()
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
