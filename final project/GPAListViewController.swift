import UIKit

class GPAListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var totalCreditHoursLabel: UILabel!
    @IBOutlet weak var projectedGradeLabel: UILabel!    
    fileprivate var model = GPAListModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        tableView.delegate = self
        tableView.dataSource = self

        
        
        //test tableview
/*
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test", creditHours: 1, projectedGrade: "A", replacementGrade: false, oldGrade: ""))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test2", creditHours: 2, projectedGrade: "B", replacementGrade: false, oldGrade: ""))
        model.addGPAEntry(gpaEntry: GPAEntry(name: "Test3", creditHours: 3, projectedGrade: "D+", replacementGrade: false, oldGrade: ""))
*/
    }

    
    @IBAction func unwindToClassList(sender: UIStoryboardSegue) {
        
        if let sourceViewController = sender.source as? AddClassViewController, let gpaEntry = sourceViewController.gpaEntry {
            
            // Add a GPAEntry
            print("unwinging and creating gpaEntry")
            let newIndexPath = IndexPath(row: model.count, section: 0)
            model.addGPAEntry(gpaEntry: gpaEntry)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
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
        

        
        
        print("trying to decorate")
        
        print("\(gpaEntry.name) - \(gpaEntry.creditHours) - \(gpaEntry.projectedGrade)")
        
        
        cell.decorate(with: gpaEntry)
        
        
        
        
 
        return cell
 
    }
    
    
    
    
}



