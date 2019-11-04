//
//  ViewController.swift
//  HandicapCalculator
//
//  Created by R Veen on 29/09/2019.
//  Copyright © 2019 R Veen. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var currentHandicap: UITextField!
    @IBOutlet weak var stablefordPoints: UITextField!
    
    @IBOutlet weak var nineOrEighteen: UISegmentedControl!
    
    @IBOutlet weak var newHandicap: UILabel!
    
    @IBOutlet weak var calculateButton: UIButton!
    
    let validNumericCharacters = CharacterSet(charactersIn: " 0123456789")
    let formatter = NumberFormatter()
    
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
            newHandicap.textColor = (calculatedNewHandicap > currentHandicapValue! ? .red : .blue)
            newHandicap.text = formatter.string(from: NSNumber(value: calculatedNewHandicap))
        } catch {
            newHandicap.textColor = .red
            newHandicap.text = "9 hole qualifying not allowed"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculateButton.layer.cornerRadius = 5
        calculateButton.layer.borderWidth = 1
        calculateButton.layer.borderColor = UIColor.black.cgColor
        currentHandicap.text = ""
        stablefordPoints.text = ""
        newHandicap.text = ""
        currentHandicap.delegate = self
        stablefordPoints.delegate = self
        currentHandicap.becomeFirstResponder()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string.isEmpty {
            return true
        }
        
        let currentText = textField.text ?? ""
        let newText = (currentText as NSString).replacingCharacters(in: range, with: string)
        
        
        if textField === stablefordPoints {
            if let _ = string.rangeOfCharacter(from: validNumericCharacters) {
                return true
            } else {
                return false
            }
        }
        
        if textField === currentHandicap {
            let decimalSeperator = formatter.decimalSeparator ?? "."
            if formatter.number(from: newText) != nil {
                let split = newText.components(separatedBy: decimalSeperator)
                let digits = split.count == 2 ? split.last ?? "" : ""
                return digits.count <= 1
            }
        }
        
        
        return false
    }
    
//    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
//        if (UIDevice.current.userInterfaceIdiom == .phone) {
//            return .portrait
//        } else {
//            return .all
//        }
//    }


}

