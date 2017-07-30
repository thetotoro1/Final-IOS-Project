import Foundation




class GPAListModel {
    
    private var gpaEntries = [GPAEntry]()
    
    var previousCreditHours: Int = 0
    var previousGPA: Double = 0
    
    var totalCreditHours: Int = 0
    var ProjectedGPA: Double = 0
    
    
    
    
    var count: Int {
        return gpaEntries.count
    }
    
    func addGPAEntry(gpaEntry: GPAEntry){
        gpaEntries.append(gpaEntry)
    }
    
    func editGPAEntry(at index: Int, gpaEntry: GPAEntry){
        gpaEntries[index] = gpaEntry
    }
    
    func deleteGPAEntry(at index: Int){
        gpaEntries.remove(at: index)
        
    }
    
    
    func getEntry(atIndex index: Int) -> GPAEntry?   {
        return gpaEntries.element(at: index)
    }
    
    
    func getOverallCreditHours() -> Int {
        var creditHourTotal: Int = previousCreditHours
        for gpaEntry in gpaEntries {
            if !gpaEntry.replacementGrade {
                creditHourTotal = creditHourTotal + gpaEntry.creditHours
            }
        }
        return creditHourTotal
    }
    
    func getOveralGPA() -> Double {
        
        var totalGPAPoints: Double = previousGPA * Double(previousCreditHours)
        var creditHourTotal: Int = previousCreditHours
        
        
        //loop through gpa entries and if it has gpaPoints add points and if it isnt a replacment add the credit hours
        for gpaEntry in gpaEntries {
            if let gpaPoints = gpaEntry.gpaPoints{
                
                if !gpaEntry.replacementGrade {
                    creditHourTotal = creditHourTotal + gpaEntry.creditHours
                    
                }
                
                
                totalGPAPoints = totalGPAPoints + gpaPoints
            }
        }
        
        
        if creditHourTotal == 0 {
            return 0
        }
        
        let newGPA = totalGPAPoints / Double(creditHourTotal)
        
        print("total gpa Points: \(totalGPAPoints) / \(creditHourTotal) = \(newGPA)")
        
        
        return newGPA
    }
    
    
    
}

extension Array {
    func element(at index: Int) -> Element? {
        if index < 0 { return nil }
        if index >= self.count { return nil }
        return self[index]
    }
}
