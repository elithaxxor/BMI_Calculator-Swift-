
import UIKit

class CalculateViewController: UIViewController {
    
    // State
    var calculate = calcLogic()
    

    // sliding bars, for weight and height.
    @IBOutlet weak var HeightSlider: UISlider!
    @IBOutlet weak var WeightSlider: UISlider!
    
    // text labels, top right of slider bars.
    @IBOutlet weak var HeightLabel: UILabel!
    @IBOutlet weak var WeightLabel: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // calculate.getBMIVal()
    }

    
    @IBAction func HeightSlider(_ sender: UISlider) {
        let height = String(format: "%.2f", sender.value)
        HeightSlider.value = sender.value
        HeightLabel.text = "\(height)"
        
        print("[height]: \(height) ")
        print(":\(HeightSlider.value) ")
    }
    
    @IBAction func WeightSlider(_ sender: UISlider) {
        let weight = Int(sender.value)
        let stringWeight = String(format: "%.2f", sender.value)
        WeightSlider.value = Float(sender.value)
        WeightLabel.text = stringWeight
    
        print("[weight]: \(weight) lbs")
        print(": \(WeightSlider.value )")
    }
    
    @IBAction func CalcBtn(_ sender: UIButton) {
        // Calculations
        let height = HeightSlider.value
        let weight = WeightSlider.value
        let bmi = weight / (height * weight) // [For Debugger]
       
        // Pass UserInput to calcLogic model
        calculate.calculateBMI(height: height, weight: weight)
        
        print("[BMI] \(bmi)")
        print("calc btn  \(sender.isTouchInside)")

        // Segue to Results View Controller
        self.performSegue(withIdentifier: "ResultsSegue", sender: self)
        
        /*  [For Sample ViewController]
             obj to second view controller
             let bmiString = String(format: "%.1f", bmi)
             let VC2 = SampleViewController()
             Intilize ViewController page transisiton
             VC2.bmi = bmiString
             self.present(VC2, animated: true, completion: nil)
         */
    }
    
    /* TO BIND RESULTS TO SEGUE (RESULTS VIEW CONTROLLER) */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        if segue.identifier == "ResultsSegue" {
            let destinationView = segue.destination as! ResultsViewController
            destinationView.bmiSeg = calculate.getBMIVal() // call for calculation.
            destinationView.advice = calculate.getAdvice()
            destinationView.color = calculate.getColor()
        }
            
    }

}

