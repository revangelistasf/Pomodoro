//
//  TimerButtonStyle.swift
//  Main
//
//  Created by Roberto Evangelista on 11/12/2024.
//

import SwiftUI

struct TimerButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding(8)
			.background(.clear)
			.foregroundStyle(.white)
			.border(.white)
			.scaleEffect(configuration.isPressed ? 0.95 : 1)
			.animation(.easeOut(duration: 0.3), value: configuration.isPressed)
	}
}
