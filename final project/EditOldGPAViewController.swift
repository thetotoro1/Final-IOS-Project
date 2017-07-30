import UIKit

class EditOldGPAViewController: UIViewController {
    @IBOutlet weak var creditHourTextField: UITextField!
    @IBOutlet weak var gpaTextField: UITextField!
    
    @IBOutlet weak var updateButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(tappedBackground(_:)))
        view.addGestureRecognizer(tap)
        
        creditHourTextField.delegate = self
        gpaTextField.delegate = self
    }
    
    func tappedBackground(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    @IBAction func updateButtonPressed(_ sender: UIButton) {
    }
    
    
    
    
    
    
}

extension EditOldGPAViewController: UITextFieldDelegate {
    

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}
