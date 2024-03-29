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
    @IBOutlet weak var hoursButton: UIButton!
    @IBOutlet weak var minutesButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    
    // MARK: - Properites
    
    enum Weight {
        case pounds
        case kilograms
    }
    
    enum Time {
        case minutes
        case hours
    }
    
    var weightUnit: Weight = .pounds // Default unit used for calculation is in pounds
    var timeUnit: Time = .minutes // Default used is minutes
    
    // MARK: - Functions
    
    override func viewDidLoad() {
        super.viewDidLoad()
        poundsButton.isSelected = true
        minutesButton.isSelected = true
        weightLabel.text = "Weight (lbs):"
        cookTimeLabel.text = "Cook Time (minutes):"
        errorMessageLabel.text = nil
    }
    
    func calculateCookTime(with weight: Double, from unit: Weight) -> Double {
        var cookTime: Double
        if weightUnit == .pounds {
            if weight >= 1 {
                cookTime = weight * 15
            } else {
                cookTime = 0
            }
        } else {
            if weight >= 4 {
                cookTime = weight * 20 + 90
            } else if weight >= 1 {
                cookTime = weight * 20 + 70
            } else {
                cookTime = 0
            }
        }
        return cookTime
    }
    
    func convertToHours(minutes: Double) -> Double {
        let timeInHours = minutes / 60
        return timeInHours
    }

    @IBAction func calculateCookTimePressed(_ sender: Any) {
         guard let weightString = weightTextField.text,
            let weight = Double(weightString) else { return }
        
        if poundsButton.isSelected {
            weightUnit = .pounds
        } else {
            weightUnit = .kilograms
        }
        let cookTimeMinutes = calculateCookTime(with: weight, from: weightUnit)
        if timeUnit == .minutes {
            timeToCookTextField.text = "\(cookTimeMinutes)"
        } else {
            let cookTimeInHours = convertToHours(minutes: cookTimeMinutes)
            timeToCookTextField.text = "\(cookTimeInHours)"
        }
        if weight < 1 {
            errorMessageLabel.text = "The turkey's gotta be at least 1 lb or kg!"
            timeToCookTextField.text = nil
        } else {
            errorMessageLabel.text = nil
        }
    }
    
    @IBAction func cookTimePounds(_ sender: Any) {
        guard let poundsButton = sender as? UIButton else { return }
        poundsButton.isSelected.toggle()
        kilogramsButton.isSelected = false
        weightLabel.text = "Weight (lbs):"
        calculateCookTimePressed(sender)
    }
    
    @IBAction func cookTimeKilograms(_ sender: Any) {
        guard let kilogramsButton = sender as? UIButton else { return }
        kilogramsButton.isSelected.toggle()
        poundsButton.isSelected = false
        weightLabel.text = "Weight (kg):"
        calculateCookTimePressed(sender)
    }
    
    @IBAction func hoursButtonSelected(_ sender: Any) {
        guard let hoursButton = sender as? UIButton else { return }
        hoursButton.isSelected.toggle()
        minutesButton.isSelected = false
        cookTimeLabel.text = "Cook Time (Hours):"
        timeUnit = .hours
        calculateCookTimePressed(sender)
    }
    
    @IBAction func minutesButtonSelected(_ sender: Any) {
        guard let minutesButton = sender as? UIButton else { return }
        minutesButton.isSelected.toggle()
        hoursButton.isSelected = false
        cookTimeLabel.text = "Cook Time (Minutes):"
        timeUnit = .minutes
        calculateCookTimePressed(sender)
        }
}

