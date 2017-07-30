import UIKit

class GPAListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalCreditHoursLabel: UILabel!
    @IBOutlet weak var projectedGradeLabel: UILabel!    
    fileprivate var model = GPAListModel()
    @IBOutlet weak var previousHoursLabel: UILabel!
    @IBOutlet weak var previousGPALabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        previousHoursLabel.text = String(model.previousCreditHours)
        previousGPALabel.text = String(model.previousGPA)
        totalCreditHoursLabel.text = String(model.totalCreditHours)
        projectedGradeLabel.text = String(model.ProjectedGPA)
        
        
        tableView.delegate = self
        tableView.dataSource = self

        
        
        //test tableview

        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test", creditHours: 1, projectedGrade: "A", replacementGrade: false, oldGrade: "", gpaPoints: 10))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test2", creditHours: 2, projectedGrade: "", replacementGrade: false, oldGrade: "", gpaPoints: 12))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test3", creditHours: 3, projectedGrade: "D+", replacementGrade: true, oldGrade: "D", gpaPoints: 3))

    }

    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AddClassViewController, let gpaEntry = sourceViewController.gpaEntry {
            
            
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update gpaEntry
                print("Updating Entry at row \(selectedIndexPath)")
                model.addGPAEntry(at: selectedIndexPath.row, gpaEntry: gpaEntry)
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
                tableView.reloadData()
            }
            else {
                // Add a GPAEntry
                print("Adding new gpaEntry")
                let newIndexPath = IndexPath(row: model.count, section: 0)
                model.addGPAEntry(gpaEntry: gpaEntry)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
        }
        
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        print("in tableview cell for row at")
        

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
            print("q to add class")
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
            
            let selectedMeal = model.getEntry(atIndex: indexPath.row)
            addClassDetailsViewController.gpaEntry = selectedMeal
            
        default:
            print("Error in prepare in gpalistviewcontroller")
        }
    }
    
    
    
    
    
}



