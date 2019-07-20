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
        // Do any additional setup after loading the view.
    }
    
    func calculateCookTime(with weight: Double) -> Double {
        var cookTime: Double
        
        if unit == .pounds {
            cookTime = weight * 5
        } else {
            cookTime = weight * 10
        }
        
        return cookTime
    }

    @IBAction func calculateCookTimePressed(_ sender: Any) {
         guard let weightString = weightTextField.text, let weight = Double(weightString) else { return }
        
       
    }
    
    @IBAction func cookTimePounds(_ sender: Any) {
    }
    
    @IBAction func cookTimeKilograms(_ sender: Any) {
    }
    

}

