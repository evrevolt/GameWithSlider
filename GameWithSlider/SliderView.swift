//
//  SliderView.swift
//  GameWithSlider
//
//  Created by Геннадий Ведерников on 14.11.2022.
//

import SwiftUI

struct SliderView: View {
    
    @Binding var sliderValue: Double
    var body: some View {
        
        Slider(value: $sliderValue, in: 1...100) {
            Text("10")
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView(sliderValue: .constant(10))
    }
}
