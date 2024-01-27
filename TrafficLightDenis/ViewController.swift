//
//  ViewController.swift
//  TrafficLightDenis
//
//  Created by Denis Denisov on 26/1/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var buttonView: UIButton!
    
// Настройка элементов интерфейса после загрузки View
    override func viewDidLayoutSubviews() {
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.layer.cornerRadius = $0.frame.size.width / 2
        }
        buttonView.layer.cornerRadius = 10
    }
    
    @IBAction func buttonViewDidTapped() {
        buttonView.setTitle("Next", for: .normal)
        switchTrafficLight()
    }
    
    private func switchTrafficLight() {
        if redLightView.alpha == 1 {
            updateTrafficLightState(yellowLightTransparency: 1)
        } else if yellowLightView.alpha == 1 {
            updateTrafficLightState(greenLightTransparency: 1)
        } else {
            updateTrafficLightState(redLightTransparency: 1)
        }
    }

    private func updateTrafficLightState(
        redLightTransparency: CGFloat = 0.3,
        yellowLightTransparency: CGFloat = 0.3,
        greenLightTransparency: CGFloat = 0.3
    ) {
        self.redLightView.alpha = redLightTransparency
        self.yellowLightView.alpha = yellowLightTransparency
        self.greenLightView.alpha = greenLightTransparency
    }
}

