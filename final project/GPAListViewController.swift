import UIKit

class GPAListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var totalCreditHoursLabel: UILabel!
    @IBOutlet weak var projectedGPALabel: UILabel!
    @IBOutlet weak var previousHoursLabel: UILabel!
    @IBOutlet weak var previousGPALabel: UILabel!
    
    fileprivate var model = GPAListModel()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        previousHoursLabel.text = String(model.previousCreditHours)
        previousGPALabel.text = String(model.previousGPA)
        totalCreditHoursLabel.text = String(model.totalCreditHours)
        projectedGPALabel.text = String(model.ProjectedGPA)
        
        
        
        
        
        tableView.delegate = self
        tableView.dataSource = self

       
        /*
        //test tableview
        previousHoursLabel.text = "1.7"
        model.previousCreditHours = 3
        previousGPALabel.text = "1.7"
        model.previousGPA = 1.7
        
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test", creditHours: 3, projectedGrade: "A", replacementGrade: false, oldGrade: "", gpaPoints: 12))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test2", creditHours: 3, projectedGrade: "", replacementGrade: false, oldGrade: "", gpaPoints: nil))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test3", creditHours: 3, projectedGrade: "A", replacementGrade: true, oldGrade: "C-", gpaPoints: 6.9))
        */
        updateTotals()
    }

    
    func updateTotals(){
        
        totalCreditHoursLabel.text = String(model.getOverallCreditHours())
        projectedGPALabel.text = String(format: "%.2f", model.getOveralGPA())
        
        
    }
    
    
    
    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AddClassViewController, let gpaEntry = sourceViewController.gpaEntry {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update gpaEntry
                model.editGPAEntry(at: selectedIndexPath.row, gpaEntry: gpaEntry)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                tableView.reloadData()
            }
            else {
                // Add a GPAEntry
                let newIndexPath = IndexPath(row: model.count, section: 0)
                model.addGPAEntry(gpaEntry: gpaEntry)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
        
        
        if let sourceViewController = sender.source as? EditOldGPAViewController, let creditHoursEntry = sourceViewController.previousCreditHours, let gpaEntry = sourceViewController.previousGPA {
            
            model.previousCreditHours = creditHoursEntry
            model.previousGPA = gpaEntry
            
            
            previousHoursLabel.text = String(model.previousCreditHours)
            previousGPALabel.text = String(model.previousGPA)
            
            
        }
        
        updateTotals()
        
    }


    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            model.deleteGPAEntry(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
            updateTotals()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "GPACell", for: indexPath) as? GPATableViewCell,
            let gpaEntry = model.getEntry(atIndex: indexPath.row)
            else {
                return UITableViewCell()
        }
        
        cell.decorate(with: gpaEntry)

        return cell
 
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddClass":
            return
        case "showGPAEntryDetails":
            guard let addClassDetailsViewController = segue.destination as? AddClassViewController else {
                return
            }
            
            guard let selectedGPAEntryCell = sender as? GPATableViewCell else {
                return
            }
            
            guard let indexPath = tableView.indexPath(for: selectedGPAEntryCell) else {
                return
            }
            
            let selectedEntry = model.getEntry(atIndex: indexPath.row)
            addClassDetailsViewController.gpaEntry = selectedEntry
        case "previousDetailsSegue":
            guard let editOldGPAViewController = segue.destination as? EditOldGPAViewController else {
                return
            }
            
            editOldGPAViewController.previousCreditHours = model.previousCreditHours
            editOldGPAViewController.previousGPA = model.previousGPA
        default:
            print("Error in prepare in gpalistviewcontroller")
        }
    }
    
    
    
    
    
}



