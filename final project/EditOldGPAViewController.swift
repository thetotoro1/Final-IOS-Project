import UIKit

class EditOldGPAViewController: UIViewController {
    @IBOutlet weak var creditHourTextField: UITextField!
    @IBOutlet weak var gpaTextField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    
    
    var previousCreditHours: Int?
    var previousGPA: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        
        
        if let previousCreditHours = previousCreditHours, let previousGPA = previousGPA {
            creditHourTextField.text = String(previousCreditHours)
            gpaTextField.text = String(previousGPA)
        }
        
        
        
        creditHourTextField.delegate = self
        gpaTextField.delegate = self
    }
    
    func tappedBackground(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
    }
    
    // configure gpaEntry
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        
        guard let button = sender as? UIButton, button === updateButton else {
            print("error in sender updateButton")
            return
        }
        
        guard
        let creditHourString = creditHourTextField.text,
        let gpaString = gpaTextField.text
        else {
            return
        }
        
        guard
            let creditHourInt = Int(creditHourString),
            let gpaDouble = Double(gpaString)
            else {
            return
        }
        
        previousCreditHours = creditHourInt
        previousGPA = gpaDouble
        
    }
    
    
    
    
    
}

extension EditOldGPAViewController: UITextFieldDelegate {
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
