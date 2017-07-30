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
    
    func getEntry(atIndex index: Int) -> GPAEntry?   {
        return gpaEntries.element(at: index)
    }
    
    func addGPAEntry(at index: Int, gpaEntry: GPAEntry){
        gpaEntries[index] = gpaEntry
    }
    
}

extension Array {
    func element(at index: Int) -> Element? {
        if index < 0 { return nil }
        if index >= self.count { return nil }
        return self[index]
    }
}
