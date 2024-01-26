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
    
    private var lightCornerRadius: CGFloat {
        redLightView.frame.size.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonView.layer.cornerRadius = 10
    }
    
//    Корректировка радиуса светофора под разные устройства после загрузки View
    override func viewDidLayoutSubviews() {
        redLightView.layer.cornerRadius = lightCornerRadius
        yellowLightView.layer.cornerRadius = lightCornerRadius
        greenLightView.layer.cornerRadius = lightCornerRadius
    }
    
    @IBAction func buttonViewTapped(_ sender: UIButton) {
        sender.setTitle("Next", for: .normal)
        switchLight()
    }
    
    private func switchLight() {
        if redLightView.alpha == 1 {
            updateLight(
                redLightTransparency: 0.3,
                yellowLightTransparency: 1,
                greenLightTransparency: 0.3
            )
        } else if yellowLightView.alpha == 1 {
            updateLight(
                redLightTransparency: 0.3,
                yellowLightTransparency: 0.3,
                greenLightTransparency: 1
            )
        } else {
            updateLight(
                redLightTransparency: 1,
                yellowLightTransparency: 0.3,
                greenLightTransparency: 0.3
            )
        }
    }

    private func updateLight(
        redLightTransparency: CGFloat,
        yellowLightTransparency: CGFloat,
        greenLightTransparency: CGFloat
    ) {
        self.redLightView.alpha = redLightTransparency
        self.yellowLightView.alpha = yellowLightTransparency
        self.greenLightView.alpha = greenLightTransparency
    }
}

