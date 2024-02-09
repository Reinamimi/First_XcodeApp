//
//  ViewController.swift
//  Assignment_1
//
//  Created by mac on 31/01/2024.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var hUnitLabel: UILabel!
    
    @IBOutlet weak var wUnitLabel: UILabel!
    
    @IBOutlet weak var heightLabel: UILabel!
    
    @IBOutlet weak var weightLabel: UILabel!
    
    @IBOutlet weak var bmiResult: UILabel!
  
    @IBOutlet weak var heightTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var categoryResult: UILabel!
    
    @IBOutlet weak var bmiLabel: UILabel!
    
    @IBOutlet weak var categoryLabel: UILabel!
    
    @IBOutlet weak var measuresSegmentedControl: UISegmentedControl!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    var unit = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        bmiLabel.isHidden = true
        categoryLabel.isHidden = true
        bmiResult.isHidden = true
        categoryResult.isHidden = true
  
    }
    
    
    @IBAction func UnitIndexChanged(_ sender: UISegmentedControl) {
        
        //        clear fields on toggle
        heightTextField.text = ""
        weightTextField.text = ""
        bmiResult.text = ""
        categoryResult.text = ""
        bmiLabel.isHidden = true
        categoryLabel.isHidden = true
        bmiResult.isHidden = true
        categoryResult.isHidden = true
        
        switch measuresSegmentedControl.selectedSegmentIndex {
        case 0:
            hUnitLabel.text = "(cm)"
            wUnitLabel.text = "(kg)"
        case 1:
            hUnitLabel.text = "(inch)"
            wUnitLabel.text = "(lb)"
        default:
            break
        }
    }
    
    @IBAction func computeClicked(_ sender: Any) {
        errorLabel.text = ""
        let heightInput = heightTextField.text!
        let weightInput = weightTextField.text!
        
        //        check unit sent
        if measuresSegmentedControl.selectedSegmentIndex == 0 {
            unit = "kg,cm"
        } else {
            unit = "inch,lb"
        }
        
        // Validate user inputs (using guard let statement)
        guard let weight = Double(weightInput),  weight >= 0, weight < 1500
        else {
            errorLabel.text = "Invalid weight. Please enter a valid non-negative number."
            return
        }
        guard let height = Double(heightInput),  height >= 0, height < 300 else {
            errorLabel.text = "Invalid height. Please enter a valid non-negative number."
            return
        }
        
        bmiLabel.isHidden = false
        categoryLabel.isHidden = false
        bmiResult.isHidden = false
        categoryResult.isHidden = false
        
        let result = BmiService().calculateBMI(height: height, weight: weight, unit: unit)
        bmiResult.text = "\(result)"
        
        let category = BmiService().getBMICategory(bmi: result)
        categoryResult.text = "\(category)"
    }
    
    
}
