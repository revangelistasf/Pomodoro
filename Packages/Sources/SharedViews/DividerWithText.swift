//
//  DividerWithText.swift
//  Main
//
//  Created by Roberto Evangelista on 11/12/2024.
//


//
//  DividerWithText.swift
//  Pomodoro
//
//  Created by Roberto Evangelista on 23/11/2024.
//

import SwiftUI

struct DividerWithText: View {
	var texts: [String]

	var body: some View {
		HStack {
			Divider()
				.frame(height: 1)
				.frame(maxWidth: .infinity)
				.background(Color.black)

			VStack {
				ForEach(texts, id: \.self) { text in
					Text(text)
				}
			}
			.frame(minWidth: 150)
			.padding(.horizontal)


			Divider()
				.frame(height: 1)
				.frame(maxWidth: .infinity)
				.background(Color.black)
		}
		.padding(.horizontal)
	}
}
