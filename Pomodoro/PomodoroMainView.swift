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

            Text(store.timer)
                .font(.largeTitle)

            HStack(spacing: 24) {
                Button { store.send(store.isTimerRunning == false ? .startTapped : .pauseTapped) }
                label: {
                    Text(store.isTimerRunning == false ? "Start" : "Pause")
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)

                Button { store.send(.stopTapped) }
                label: {
                    Text("Stop")
                        .font(.title)
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .onAppear { store.send(.onAppear) }
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
