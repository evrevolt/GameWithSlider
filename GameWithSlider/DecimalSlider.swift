//
//  DecimalSlider.swift
//  GameWithSlider
//
//  Created by Геннадий Ведерников on 14.11.2022.
//

import SwiftUI

struct DecimalSlider: UIViewRepresentable {
    
    
    @Binding var value: Double
    
    let alpha: Int
    let color: UIColor
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.setValueSlider),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = Float(value)
        uiView.thumbTintColor = color.withAlphaComponent(CGFloat(alpha/100))
    }
    
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}


extension DecimalSlider {
    class Coordinator: NSObject {
        @Binding var value: Double
        
        init(value: Binding<Double>) {
            self._value = value
        }
        
        @objc func setValueSlider(_ sender: UISlider) {
            value = Double(sender.value)
        }
    }
}

struct DecimalSlider_Previews: PreviewProvider {
    static var previews: some View {
        DecimalSlider(value: .constant(30), alpha: 100, color: .green)
    }
}
