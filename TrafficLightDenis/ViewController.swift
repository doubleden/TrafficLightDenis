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
        redLightView.layer.cornerRadius = lightCornerRadius
        yellowLightView.layer.cornerRadius = lightCornerRadius
        greenLightView.layer.cornerRadius = lightCornerRadius
        buttonView.layer.cornerRadius = 10
    }


}

