//
//  ViewController.swift
//  TrafficLightDenis
//
//  Created by Denis Denisov on 26/1/24.
//

import UIKit

final class ViewController: UIViewController {
    
    @IBOutlet var redLightView: UIView!
    @IBOutlet var yellowLightView: UIView!
    @IBOutlet var greenLightView: UIView!
    
    @IBOutlet var buttonView: UIButton!
    
    private var currentTrafficLightState: TrafficLightState = .red
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    override func viewDidLayoutSubviews() {
        [redLightView, yellowLightView, greenLightView].forEach {
            $0.layer.cornerRadius = $0.frame.size.width / 2
        }
        buttonView.layer.cornerRadius = 10
    }
    
    @IBAction func buttonViewDidTapped() {
        if buttonView.currentTitle == "Start" {
            buttonView.setTitle("Next", for: .normal)
        }
        
        switch currentTrafficLightState {
        case .red:
            updateTrafficLightState(
                red: lightIsOn,
                yellow: lightIsOff,
                green: lightIsOff
            )
            currentTrafficLightState = .yellow
        case .yellow:
            updateTrafficLightState(
                red: lightIsOff,
                yellow: lightIsOn,
                green: lightIsOff
            )
            currentTrafficLightState = .green
        case .green:
            updateTrafficLightState(
                red: lightIsOff,
                yellow: lightIsOff,
                green: lightIsOn
            )
            currentTrafficLightState = .red
        }
    }

    private func updateTrafficLightState(
        red: CGFloat,
        yellow: CGFloat,
        green: CGFloat
    ) {
        self.redLightView.alpha = red
        self.yellowLightView.alpha = yellow
        self.greenLightView.alpha = green
    }
}

// MARK: - CurrentLightState
extension ViewController {
    private enum TrafficLightState {
        case red, yellow, green
    }
}
