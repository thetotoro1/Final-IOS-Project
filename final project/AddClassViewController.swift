import UIKit

class AddClassViewController: UIViewController, UIPickerViewDelegate {
    
    @IBOutlet weak var replacementLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var creditHourTextField: UITextField!
    @IBOutlet weak var projectedGradeTextField: UITextField!
    @IBOutlet weak var replacementSwitch: UISwitch!
    @IBOutlet weak var oldGradeLabel: UILabel!
    @IBOutlet weak var oldGradeTextField: UITextField!
    @IBOutlet weak var tappableBackground: UIView!
    @IBOutlet weak var addClassButton: UIButton!
    
    
    fileprivate var model = AddClassModel()
    
    var gpaEntry: GPAEntry?

    
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
        
        
        // Configure tappable background when keyboard or picker is displayed
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(backgroundTapped))
        tappableBackground.addGestureRecognizer(tapGestureRecognizer)
        tappableBackground.isHidden = true
        
        
        
        
        
        nameTextField.delegate = self
        creditHourTextField.delegate = self
        projectedGradeTextField.delegate = self
        oldGradeTextField.delegate = self
        
    }
    
    
    @objc private func backgroundTapped() {
        // this actually loops through all this view's subviews and resigns the first responder on all of them
        self.view.endEditing(true)
        
        tappableBackground.isHidden = true
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
    
    
    // This method lets you configure a view controller before it's presented.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        // Configure the destination view controller only when the save button is pressed.
        guard let button = sender as? UIBarButtonItem, button === addClassButton else {
            return
        }
        
        guard
            let className = nameTextField.text,
            let oldGrade = oldGradeTextField.text,
            let creditHoursString = creditHourTextField.text
        else {return}

        guard let creditHours = Int(creditHoursString) else {return}
        
        let projectedGrade = projectedGradeTextField.text ?? ""
        let replacementGrade = replacementSwitch.isOn


        // Set the meal to be passed to MealTableViewController after the unwind segue.
        gpaEntry = GPAEntry(name: className, creditHours: creditHours, projectedGrade: projectedGrade, replacementGrade: replacementGrade, oldGrade: oldGrade)
    }
    
    
  
    
    
}



extension AddClassViewController: UITextFieldDelegate {
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        tappableBackground.isHidden = false
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        tappableBackground.isHidden = true
        return true
    }
    
}
