import Foundation

class AddClassModel {
    
    var gradeOptions = ["","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F","FN"]
    var oldGradeOptions = ["","C-", "D+", "D", "D-", "F", "FN"]
    
    
    func checkValidation(className: String, creditHours: Double) -> Bool {
        
        if className != "" && creditHours >= 0 {
            return true
        }
        
        
        return false
    }
    
    func calculateGPAPoints(creditHours: Int, projectedGrade: String, isReplacementGrade: Bool, oldGrade: String) -> Int {
        
        
        
        
        
        return 0
    }
    
}
