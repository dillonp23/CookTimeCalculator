//
//  ViewController.swift
//  TipCalculator
//
//  Created by Dillon P on 7/19/19.
//  Copyright © 2019 Dillon P. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var weightLabel: UILabel!
    @IBOutlet weak var cookTimeLabel: UILabel!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var timeToCookTextField: UITextField!
    @IBOutlet weak var poundsButton: UIButton!
    @IBOutlet weak var kilogramsButton: UIButton!
    
    // MARK: - Properites
    
    enum Weight {
        case pounds
        case kilograms
    }
    
    var unit: Weight = .pounds // Default unit used for calculation is in pounds
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poundsButton.isSelected = true
        weightLabel.text = "Weight (lbs):"
    }
    
    func calculateCookTime(with weight: Double, from unit: Weight) -> Double {
        var cookTime: Double
        
        if unit == .pounds {
            cookTime = weight * 15
        } else {
            if weight >= 4 {
                cookTime = weight * 20 + 90
            } else {
                cookTime = weight * 20 + 70
            }
        }
        
        return cookTime
    }
    
    func convertToHours(minutes: Double) -> Double {
        let timeInHours = minutes / 60
        return timeInHours
    }

    @IBAction func calculateCookTimePressed(_ sender: Any) {
         guard let weightString = weightTextField.text, let weight = Double(weightString) else { return }
        
        if poundsButton.isSelected {
            unit = .pounds
        } else {
            unit = .kilograms
        }
        
        let cookTimeDouble = calculateCookTime(with: weight, from: unit)
        let cookTimeInHours = convertToHours(minutes: cookTimeDouble)
        
        timeToCookTextField.text = "\(cookTimeInHours)"
        
    }
    
    @IBAction func cookTimePounds(_ sender: Any) {
    }
    
    @IBAction func cookTimeKilograms(_ sender: Any) {
    }
    

}

