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
    
    @IBOutlet weak var nineOrEighteen: UISegmentedControl!
    
    @IBOutlet weak var newHandicap: UILabel!
    
    @IBAction func calculateNewHandicapClicked(_ sender: Any) {
        let currentHandicapValue: Double? = Double(currentHandicap.text!)
        let stablefordPointsValue: Int? = Int(stablefordPoints.text!)
        let calculator = HandicapCalculator()
        do {
            let calculatedNewHandicap = try calculator.calculate(currentHandicap: currentHandicapValue!,
                                                                 stablefordPoints: stablefordPointsValue!,
                                                                 half: (nineOrEighteen.selectedSegmentIndex == 1))
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 1
            formatter.maximumFractionDigits = 1
            newHandicap.text = formatter.string(from: NSNumber(value: calculatedNewHandicap))
        } catch {
            newHandicap.text = "9 hole qualifying not allowed"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentHandicap.text = ""
        stablefordPoints.text = ""
        newHandicap.text = ""
    }


}

