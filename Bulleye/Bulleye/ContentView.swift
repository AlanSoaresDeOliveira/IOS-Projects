//
//  ContentView.swift
//  Bulleye
//
//  Created by Alan Soares on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible = false
    @State var sliderValue = 50.0
    @State var target = Int.random(in: 1...100)
    @State var score = 0
    
    var body: some View {
        
        VStack {
            // Target row
            Spacer()
            HStack {
                Text("Put the bullseye as close as you can to:")
                Text("\(self.target)")
            }
            Spacer()
            // Slider row
            HStack {
                Text("1")
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                self.alertIsVisible = true
                self.score += self.pointsForCurrentRound()
            }) {
                Text("Hit me!")
            }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    
                    
                    return Alert(title: Text("Hello There!"), message: Text(
                        "This slider's value is \(sliderValueRounded()).\n" +
                            "You scored \(pointsForCurrentRound()) points this round"
                         ), dismissButton: .default(Text("Awesome!")))
                    
                }
            Spacer()
            // Score row
            HStack {
                Button(action:  {}) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score)")
                Spacer()
                Text("Round:")
                Text("999")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Info")
                })
            }.padding(.bottom, 30)
        }
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func pointsForCurrentRound() -> Int {
        100 - abs(target - sliderValueRounded())
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
