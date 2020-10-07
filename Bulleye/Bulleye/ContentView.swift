//
//  ContentView.swift
//  Bulleye
//
//  Created by Alan Soares on 01/10/20.
//

import SwiftUI

struct ContentView: View {
    @State var alertIsVisible: Bool = false
    @State var whosThereIsVisible: Bool = false
    
    var body: some View {
        
        VStack {
            Text("Welcome to my first app!")
                .fontWeight(.semibold)
                .foregroundColor(Color.green)
            
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
            
            Button(action: {
                self.whosThereIsVisible = true
            }) {
                Text("Knock Knock")
            }
                .alert(isPresented: $whosThereIsVisible) { () ->
                    Alert in
                    return Alert(title: Text("Whos There?"), message: Text("It's me, Alan"), dismissButton: .default(Text("Awesome!")))
                }
                .frame(height: 50)
                .padding(.all)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
