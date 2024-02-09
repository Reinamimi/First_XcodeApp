//
//  BmiService.swift
//  Assignment_1
//
//  Created by mac on 31/01/2024.
//

import Foundation

class BmiService {
    
    func calculateBMI(height : Double , weight: Double , unit: String) -> Double {
        
        var bmi : Double = 0
        let height = height / 100
        
        if unit == "kg,cm" {
            bmi = weight / pow(height, 2)
        }
        
        return bmi
    }
    
    func getBMICategory(bmi : Double) -> String {
        var bmiCategory : String = ""
        
        switch bmi {
                case ..<18.5:
                    bmiCategory = "Underweight"
                case 18.5..<24.9:
                    bmiCategory = "Normal Weight"
                case 25..<29.9:
                    bmiCategory = "Overweight"
                default:
                    bmiCategory = "Obese"
                }
        return bmiCategory
    
    }
    
    
    
    
}
