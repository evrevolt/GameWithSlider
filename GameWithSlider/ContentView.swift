//
//  ContentView.swift
//  GameWithSlider
//
//  Created by Геннадий Ведерников on 14.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue = 50.0
    @State private var alertIsPresented = false
    @State private var randomValue = Int.random(in: 1...100)
    
    var body: some View {
        VStack {
            Text("Подвинуть слайдер как можно ближе к: \(randomValue)")
            
            
            SliderView(sliderValue: $sliderValue)
            
            
            Button("Проверить меня") {
                alertIsPresented.toggle()
            }
            .padding(.top, 30.0)
            .alert("Ваш результат", isPresented: $alertIsPresented) {
                Button("OK", role: .cancel) {}
            }
            
            Button("Начать заново") {
                
                
            }
            .padding(.top, 30.0)
            
        }
        .padding()
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
