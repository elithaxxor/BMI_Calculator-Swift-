
import UIKit

struct calcLogic {
    var bmi: BMI? // to change value later
    
    
    func getBMIVal () -> String {
        
        if bmi != nil {
            let formattedBMI = String(format: "%.1f", bmi?.value ?? 0.0)
            return formattedBMI
        } else {
            return "0.0"
        }
    }
    
    func getColor() -> UIColor{
        print("Getting color")
        return bmi?.color ?? .white
    }
    
    func getAdvice() -> String {
        print("getting advice")
        return bmi?.advice ?? "no advice"
    }
    
    // takes calls from bmi in models (value, advice, color)
    mutating func calculateBMI(height: Float, weight: Float){
        let bmival = weight / (height * height)
        
        if bmival < 18.5 {
            print("Users BMI under 18.5 \(bmival)")
            bmi = BMI(value: bmival, advice: "slim jim!!", color: .blue)

        } else if bmival < 24.9 {
            print("Users BMI under 24.9 \(bmival)")
            bmi = BMI(value: bmival, advice: "You are fit!", color: .green)
        } else {
            print("Users BMI over 24.9 \(bmival)")
            bmi = BMI(value: bmival, advice: "Get checked out by a dr.", color: .red)

        }
    }
}
