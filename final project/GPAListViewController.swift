import UIKit

class GPAListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalCreditHoursLabel: UILabel!
    @IBOutlet weak var projectedGradeLabel: UILabel!    
    fileprivate var model = GPAListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let testCell = GPAEntry(name: "Test", creditHours: 3, projectedGrade: "A", replacementGrade: false, oldGrade: "")
        
        model.addGPAEntry(gpaEntry: testCell)
        
        tableView.register(GPATableViewCell.self, forCellReuseIdentifier: "cell")
    }

    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AddClassViewController, let gpaEntry = sourceViewController.gpaEntry {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: model.count, section: 0)
            
            model.addGPAEntry(gpaEntry: gpaEntry)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
        
    }
}

/*
extension GPAListViewController: UITableViewDataSource {
   
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cell = tableView.dequeueReusableCell(withIdentifier: "WorkoutCell", for: indexPath) as? GPATableViewCell,
            let gpaEntry = model.getEntry(atIndex: indexPath.row)
            else {
                return UITableViewCell()
        }
        
        
        print("In tableview cellforrowat")
        
        cell.decorate(with: gpaEntry)
        
        return cell
    }
    
 
    
}

  */

