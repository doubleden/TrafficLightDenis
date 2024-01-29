//
//  ViewController.swift
//  TrafficLightDenis
//
//  Created by Denis Denisov on 26/1/24.
//

import UIKit

final class ViewController: UIViewController {
    
    enum TrafficLightState {
        case off, red, yellow, green
    }
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    @IBOutlet var buttonView: UIButton!
    
    private var currentTrafficLightState: TrafficLightState = .off
    
    override func viewDidLayoutSubviews() {
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.layer.cornerRadius = $0.frame.size.width / 2
        }
        buttonView.layer.cornerRadius = 10
    }
    
    @IBAction func buttonViewDidTapped() {
        switch currentTrafficLightState {
        case .off:
            buttonView.setTitle("Next", for: .normal)
            updateTrafficLightState(redLightTransparency: 1.0)
            currentTrafficLightState = .red
        case .red:
            updateTrafficLightState(yellowLightTransparency: 1.0)
            currentTrafficLightState = .yellow
        case .yellow:
            updateTrafficLightState(greenLightTransparency: 1.0)
            currentTrafficLightState = .green
        case .green:
            updateTrafficLightState(redLightTransparency: 1.0)
            currentTrafficLightState = .red
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

