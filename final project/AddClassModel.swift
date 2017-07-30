import Foundation

class AddClassModel {
    
    var gradeOptions = ["","A","A-","B+","B","B-","C+","C","C-","D+","D","D-","F","FN"]
    var oldGradeOptions = ["","C-", "D+", "D", "D-", "F", "FN"]
    
    
    func checkValidation(className: String, creditHours: Int) -> Bool {
        
        if className != "" && creditHours >= 0 {
            return true
        }
        
        
        return false
    }
    
    func checkReplacementValidation(className:  String, creditHours: Int, newGrade: String, oldGrade: String) -> Bool{
        
        if className != "" && creditHours >= 0 && newGrade != "" && oldGrade != "" {
            return true
        }
        
        
        return false
        
        
    }
    
    func calculateGPAPoints(creditHours: Int, projectedGrade: String, isReplacementGrade: Bool, oldGrade: String) -> Double? {
        
        var gpaPoints: Double
        
        
        switch projectedGrade {
        case "":
            return nil
        case "A":
            gpaPoints = 4.0 * Double(creditHours)
        case "A-":
            gpaPoints = 3.7 * Double(creditHours)
        case "B+":
            gpaPoints = 3.3 * Double(creditHours)
        case "B":
            gpaPoints = 3 * Double(creditHours)
        case "B-":
            gpaPoints = 2.7 * Double(creditHours)
        case "C+":
            gpaPoints = 2.3 * Double(creditHours)
        case "C":
            gpaPoints = 2 * Double(creditHours)
        case "C-":
            gpaPoints = 1.7 * Double(creditHours)
        case "D+":
            gpaPoints = 1.3 * Double(creditHours)
        case "D":
            gpaPoints = 1 * Double(creditHours)
        case "D-":
            gpaPoints = 0.7 * Double(creditHours)
        case "F":
            gpaPoints = 0 * Double(creditHours)
        case "FN":
            gpaPoints = 0 * Double(creditHours)
        default:
            return 0
        }
        
        if isReplacementGrade {
            switch oldGrade {
            case "":
                return nil
            case "C-":
                gpaPoints = gpaPoints - 1.7 * Double(creditHours)
            case "D+":
                gpaPoints = gpaPoints - 1.3 * Double(creditHours)
            case "D":
                gpaPoints = gpaPoints - 1 * Double(creditHours)
            case "D-":
                gpaPoints = gpaPoints - 0.7 * Double(creditHours)
            case "F":
                gpaPoints = gpaPoints - 0 * Double(creditHours)
            case "FN":
                gpaPoints = 0 * Double(creditHours)
            default:
                return 0
            }
        
        }
        return gpaPoints
    }
    
}
