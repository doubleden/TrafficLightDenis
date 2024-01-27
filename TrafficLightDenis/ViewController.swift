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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 10
    }
    
// Корректировка радиуса светофора под разные устройства после загрузки View
    override func viewDidLayoutSubviews() {
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.layer.cornerRadius = $0.frame.size.width / 2
        }
    }
    
    @IBAction func buttonViewTapped() {
        buttonView.setTitle("Next", for: .normal)
        switchLight()
    }
    
    private func switchLight() {
        if redLightView.alpha == 1 {
            updateLightState(
                yellowLightTransparency: 1
            )
        } else if yellowLightView.alpha == 1 {
            updateLightState(
                greenLightTransparency: 1
            )
        } else {
            updateLightState(
                redLightTransparency: 1
            )
        }
    }

    private func updateLightState(
        redLightTransparency: CGFloat = 0.3,
        yellowLightTransparency: CGFloat = 0.3,
        greenLightTransparency: CGFloat = 0.3
        
    ) {
        self.redLightView.alpha = redLightTransparency
        self.yellowLightView.alpha = yellowLightTransparency
        self.greenLightView.alpha = greenLightTransparency
    }
}

