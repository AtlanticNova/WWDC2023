//
//  SettingsView.swift
//  BubblePop
//
//  Created by Martinus Andika Novanawa on 18/04/23.
//

import SwiftUI

struct SettingsView: View {
    @State private var numberSliderValue = 15.0
    @State private var timeSliderValue = 60.0
    @State private var playerName = ""
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Game Settings")) {
                    HStack {
                        Text("Max Bubble Number")
                        Spacer()
                        Text("\(Int(numberSliderValue))")
                    }
                    Slider(value: $numberSliderValue, in: 1...50, step: 1)
                    
                    HStack {
                        Text("Game Duration (sec)")
                        Spacer()
                        Text("\(Int(timeSliderValue))")
                    }
                    Slider(value: $timeSliderValue, in: 30...120, step: 1)
                }
                
                Section(header: Text("Player Name")) {
                    TextField("Enter player name", text: $playerName)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .onTapGesture {
                            self.hideKeyboard()
                        }
                }
                
//                Section {
//                    NavigationLink(destination: BubblePopView(maxBubbleNumber: Int(numberSliderValue), remainingSeconds: Int(timeSliderValue), playerName: playerName)) {
//                        Text("Start Game")
//                    }
//                }
            }
            .navigationBarTitle("Settings")
        }
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
