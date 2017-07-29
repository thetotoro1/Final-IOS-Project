import UIKit

class GPATableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var classNameLabel: UILabel!
    @IBOutlet weak var creditHourLabel: UILabel!
    @IBOutlet weak var gradeLabel: UILabel!
    @IBOutlet weak var gradePointsLabel: UILabel!
    

    func decorate(with gpaEntry: GPAEntry) {
        classNameLabel.text = gpaEntry.name
        creditHourLabel.text = String(gpaEntry.creditHours)
        gradeLabel.text = gpaEntry.projectedGrade
        gradePointsLabel.text = "Test"
        
        print("cell decorated")
    }
    
}
