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
            creditHourTotal = creditHourTotal + gpaEntry.creditHours
        }
        return creditHourTotal
    }
    
    func getOveralGPA() -> Double {
        var totalGPAPoints: Double = previousGPA * Double(previousCreditHours)
        
        
        
        for gpaEntry in gpaEntries {
            if let gpaPoints = gpaEntry.gpaPoints{
                totalGPAPoints = totalGPAPoints + gpaPoints
            }
        }
        
        var creditHourTotal: Int = previousCreditHours
        for gpaEntry in gpaEntries {
            creditHourTotal = creditHourTotal + gpaEntry.creditHours
        }
        
        let newGPA = totalGPAPoints / Double(creditHourTotal)
        
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
