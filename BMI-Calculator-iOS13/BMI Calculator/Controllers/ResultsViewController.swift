import UIKit

class ResultsViewController: UIViewController {

    var bmiSeg: String?
    var advice: String?
    var color: UIColor?
    
    @IBOutlet weak var bmiResult: UILabel!
    @IBOutlet weak var bmiAdvice: UILabel!
    @IBOutlet weak var ReCalcBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bmiResult.text = bmiSeg
        bmiAdvice.text = advice
        view.backgroundColor = color 
        
    }

    @IBAction func ReCalcBtn(_ sender: UIButton) { // Made a mistake with sender. created a thread error. REMEMBER THIS!!
        self.dismiss(animated: true, completion: nil)
        
    }
    
}
