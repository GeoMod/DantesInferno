//
//  ContentView.swift
//  DantesInferno
//
//  Created by Daniel O'Leary on 8/11/21.
//

import SwiftUI

struct ContentView: View {
	@State private var decendToSecondCircleOfHell = false

	var body: some View {
		NavigationView {
			VStack {
				Text("First Circle")
					.font(.largeTitle.bold())
				Text("Limbo")
					.font(.largeTitle.bold())
					.foregroundColor(.red)
					.padding()

				NavigationLink(isActive: $decendToSecondCircleOfHell) {
					SecondView(hasLandedInSecondCircle: $decendToSecondCircleOfHell)
				} label: {
					Text("Visit Second Circle")
						.font(.title)
				}
				Spacer()
			}
			.navigationTitle(Text("Dante's Inferno"))
		}
	}
}


struct SecondView: View {
	@Binding var hasLandedInSecondCircle: Bool

	@State private var decendToThirdCircleOfHell = false

	var body: some View {
		NavigationView {
			VStack {
				Text("Second Circle")
					.font(.largeTitle.bold())
				Text("Lust")
					.font(.largeTitle.bold())
					.foregroundColor(.red)
					.padding()

				NavigationLink(isActive: $decendToThirdCircleOfHell) {
					ThirdView(showThird: $decendToThirdCircleOfHell)
				} label: {
					Text("Visit Third Circle")
						.font(.title)
				}

				Button {
					hasLandedInSecondCircle = false
				} label: {
					Image(systemName: "arrowshape.turn.up.backward.fill")
						.padding()
				}
				Spacer()
			}
		}
		.navigationBarHidden(true)
	}
}

struct ThirdView: View {
	@Binding var showThird: Bool

	var body: some View {
		VStack {
			Text("Third Circle")
				.font(.largeTitle.bold())
			Text("Gluttony")
				.font(.largeTitle.bold())
				.foregroundColor(.red)
				.padding()

			Button {
				showThird = false
			} label: {
				Image(systemName: "arrowshape.turn.up.backward.fill")
					.padding()
			}
			Spacer()
		}
		.navigationBarBackButtonHidden(true)
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
