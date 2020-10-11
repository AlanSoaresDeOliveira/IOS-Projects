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
    @State var round = 1
    
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
                
            }) {
                Text("Hit me!")
            }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    
                    
                    return Alert(title: Text(alertTitle()), message: Text(
                        "This slider's value is \(sliderValueRounded()).\n" +
                            "You scored \(pointsForCurrentRound()) points this round"
                    ), dismissButton: .default(Text("Awesome!")) {
                        self.score += self.pointsForCurrentRound()
                        self.target = Int.random(in: 1...100)
                        self.round += 1
                        self.sliderValue = 50.0
                    })
                    
                }
            
            Spacer()
            // Score row
            HStack {
                Button(action:  {
                    startNewRound()
                }) {
                    Text("Start over")
                }
                Spacer()
                Text("Score:")
                Text("\(score):")
                Spacer()
                Text("Round:")
                Text("\(round)")
                Spacer()
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                    Text("Info")
                })
            }.padding(.bottom, 30)
        }
        .background(Image("Background"), alignment: .center)
    }
    
    func sliderValueRounded() -> Int {
        Int(sliderValue.rounded())
    }
    
    func amountOff() -> Int {
        abs(target - sliderValueRounded())
    }
    
    func pointsForCurrentRound() -> Int {
        let maximunScore = 100
        let difference = amountOff()
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference == 1 {
            bonus = 50
        } else {
            bonus = 0
        }
        return maximunScore - difference + bonus
    }
    
    func startNewRound() -> Void {
        self.round = 1
        self.score = 0
        self.target = Int.random(in: 1...100)
        self.sliderValue = 50.0
    }
    
    func alertTitle() -> String {
        let difference = amountOff()
        let title: String
        if difference == 0 {
            title = "Perfect!"
        } else if difference < 5 {
            title = "You almost had it!"
        } else if difference <= 10 {
            title = "Not bad."
        } else {
            title = "Are you even trying?"
        }
        return title
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
