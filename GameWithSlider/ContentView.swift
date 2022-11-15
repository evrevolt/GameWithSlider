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
            
            SliderView(value: $sliderValue,
                       alpha: computeScore(),
                       color: .red,
                       randomValue: randomValue)
            
            Button("Проверить меня") {
                alertIsPresented.toggle()
            }
            .padding(.top, 30.0)
            .alert(isPresented: $alertIsPresented) {
                Alert(title: Text("Ваш результат"),
                message: Text("\(computeScore())"),
                dismissButton: .cancel())
            }
            
            Button("Начать заново") {
                withAnimation {
                    sliderValue = 50.0
                    randomValue = Int.random(in: 1...100)
                }
            }
            .padding(.top, 30.0)
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(randomValue - lround(sliderValue))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
