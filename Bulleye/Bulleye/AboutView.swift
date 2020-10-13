//
//  AboutView.swift
//  Bulleye
//
//  Created by Alan Soares on 11/10/20.
//

import SwiftUI

struct AboutView: View {
    
    let backgroundColor = Color(red: 255.0 / 255.0, green: 214.0 / 255.0, blue: 179.0 / 255.0)
    
    struct headingStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 30))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 20, leading: 0, bottom: 20, trailing: 0))
        }
    }
    
    struct textViewsStyle: ViewModifier {
        func body(content: Content) -> some View {
            return content
                .font(Font.custom("Arial Rounded MT Bold", size: 16))
                .foregroundColor(Color.black)
                .padding(EdgeInsets(top: 0, leading: 60, bottom: 20, trailing: 60))
        }
    }
        
    var body: some View {
        Group {
            VStack {
                Text("🎯 Bullseye 🎯").modifier(headingStyle())
                Text("This is Bullseye, the game where you can win points and earn fame by dragging a slider.").modifier(textViewsStyle())
                Text("You goal is to place the slider as close as possible to the target value. The closer you are, the more points you score.").modifier(textViewsStyle())
                Text("Enjoy!").modifier(textViewsStyle())
            }
            .background(backgroundColor)
            .navigationBarTitle("About Bulleye")
        }
        .background(Image("Background"))
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView().previewLayout(.fixed(width: 896, height: 414))
    }
}
