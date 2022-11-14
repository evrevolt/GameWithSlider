//
//  DecimalSlider.swift
//  GameWithSlider
//
//  Created by Геннадий Ведерников on 14.11.2022.
//

import SwiftUI

struct DecimalSlider: UIViewRepresentable {
    
    
    @Binding var value: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.value = value
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}


extension DecimalSlider {
    class Coordinator: NSObject {
        @Binding var value: Float
        
        init(value: Binding<Float>) {
            self._value = value
        }
        
        @objc func didTapDone(_ sender: UISlider) {
            value = sender.value
        }
    }
}

struct DecimalSlider_Previews: PreviewProvider {
    static var previews: some View {
        DecimalSlider(value: .constant(30))
    }
}
