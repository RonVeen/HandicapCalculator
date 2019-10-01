//
//  ViewController.swift
//  HandicapCalculator
//
//  Created by R Veen on 29/09/2019.
//  Copyright © 2019 R Veen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var currentHandicap: UITextField!
    @IBOutlet weak var stablefordPoints: UITextField!
    
    @IBOutlet weak var newHandicap: UILabel!
    
    @IBAction func calculateNewHandicapClicked(_ sender: Any) {
        let currentHandicapValue: Double? = Double(currentHandicap.text!)
        let stablefordPointsValue: Int? = Int(stablefordPoints.text!)
        let calculator = HandicapCalculator()
        let calculatedNewHandicap = calculator.calculate(currentHandicap: currentHandicapValue!, stablefordPoints: stablefordPointsValue!)
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        newHandicap.text = formatter.string(from: NSNumber(value: calculatedNewHandicap))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentHandicap.text = "36"
        stablefordPoints.text = "0"
    }


}

