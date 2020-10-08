//
//  ContentView.swift
//  Bulleye
//
//  Created by Alan Soares on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var alertIsVisible: Bool = false
    @State var sliderValue: Double = 50.0
    @State var target: Int = Int.random(in: 1...100)
    
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
                Slider(value: self.$sliderValue, in: 1...100)
                Text("100")
            }
            Spacer()
            // Button row
            Button(action: {
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    
                    var roundedValue: Int = Int(self.sliderValue.rounded())
                    return Alert(title: Text("Hello There!"), message: Text(
                        "This slider's value is \(roundedValue).\n" +
                            "You scored \(self.pointsForCurrentRound(value: roundedValue)) points this round"
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
                Text("999999")
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
    
    func pointsForCurrentRound(value: Int) -> Int {
        var difference = self.target - value
        
        if difference < 0 {
            difference = difference * -1
        }
        
        let awardedPoints: Int = 100 - difference
        
        return awardedPoints
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
