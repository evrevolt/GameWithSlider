//
//  SliderView.swift
//  GameWithSlider
//
//  Created by Геннадий Ведерников on 14.11.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    let randomValue: Int
    
    var body: some View {
        
//        Slider(value: $sliderValue, in: 1...100) {
//            Text("10")
//        } minimumValueLabel: {
//            Text("0")
//        } maximumValueLabel: {
//            Text("100")
//        }
        
        DecimalSlider(value: $value, alpha: alpha, color: color)
        
    }
}

extension SliderView {
    private func check(value: Double) {
            self.value = Double(value)
//        showAlert.toggle()
//        self.value = 0
//        text = "0"
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(value: .constant(50), alpha: 100, color: .white, randomValue: 60)
    }
}
