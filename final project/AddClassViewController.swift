import UIKit

class AddClassViewController: UIViewController,  UITextFieldDelegate, UIPickerViewDelegate {
    
    @IBOutlet weak var replacementLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creditHourTextField: UITextField!
    @IBOutlet weak var projectedGradeTextField: UITextField!
    @IBOutlet weak var replacementSwitch: UISwitch!
    @IBOutlet weak var oldGradeLabel: UILabel!
    @IBOutlet weak var oldGradeTextField: UITextField!
    
    fileprivate var model = AddClassModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        oldGradeTextField.isHidden = true
        oldGradeLabel.isHidden = true
        
        //setting up picker for grades
        let gradePickerView = UIPickerView()
        gradePickerView.delegate = self
        gradePickerView.tag = 0
        projectedGradeTextField.inputView = gradePickerView

        
        
        
        let oldGradePickerView = UIPickerView()
        oldGradePickerView.delegate = self
        oldGradePickerView.delegate = self
        oldGradePickerView.tag = 1
        oldGradeTextField.inputView = oldGradePickerView
        
        
        
        
        
        
        
        nameTextField.delegate = self
        creditHourTextField.delegate = self
        projectedGradeTextField.delegate = self
        oldGradeTextField.delegate = self
        
    }
    


    @IBAction func replacementSwitchPressed(_ sender: UISwitch) {
        if sender.isOn {
            oldGradeTextField.isHidden = false
            oldGradeLabel.isHidden = false
        }
        else{
            oldGradeTextField.isHidden = true
            oldGradeLabel.isHidden = true
        }
    }
    
    @IBAction func addClassButtonPressed(_ sender: UIButton) {
        
    }
    
   
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        if pickerView.tag == 0 {
            
            return model.gradeOptions.count
            
        }
        
        if pickerView.tag == 1 {
            
            return model.oldGradeOptions.count
            
        }
        
        return 0
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            
            return model.gradeOptions[row]
            
        }
        
        if pickerView.tag == 1 {
            
            return model.oldGradeOptions[row]
            
        }
        
        return nil
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        if pickerView.tag == 0 {
            
            projectedGradeTextField.text = model.gradeOptions[row]
            
        }
        
        if pickerView.tag == 1 {
            
            oldGradeTextField.text = model.oldGradeOptions[row]
            
        }
    }
    
}
