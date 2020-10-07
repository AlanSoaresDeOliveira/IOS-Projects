//
//  ContentView.swift
//  Bulleye
//
//  Created by Alan Soares on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    
    var body: some View {
        
        VStack {
            // Target row
            Text("Welcome to my first app!")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            // Slider row
            
            // Button row
            Button(action: {
                print("Button pressed")
                self.alertIsVisible = true
            }) {
                Text("Hit me!")
            }
                .alert(isPresented: $alertIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Hello There!"), message: Text("This is my first pop-up"), dismissButton: .default(Text("Awesome!")))
                }
            // Score row
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().previewLayout(.fixed(width: 896, height: 414))
    }
}
