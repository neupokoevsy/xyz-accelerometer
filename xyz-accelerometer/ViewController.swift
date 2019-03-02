//
//  ViewController.swift
//  xyz-accelerometer
//
//  Created by Sergey Neupokoev on 2/3/19.
//  Copyright © 2019 Sergey Neupokoev. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var motionManager: CMMotionManager!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    
    func updateLabels (data: CMAccelerometerData?, error: Error?) {
        guard let accelerometerData = data else {return}
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        xLabel.text = "X: \(x)"
        yLabel.text = "Y: \(y)"
        zLabel.text = "Z: \(z)"
        
    }


}

