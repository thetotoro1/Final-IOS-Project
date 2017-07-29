import Foundation




class GPAListModel {
    
    private var GPAEntries = [GPAEntry]()
    
    
    var count: Int {
        return GPAEntries.count
    }
    
    func addGPAEntry(gpaEntry: GPAEntry){
        GPAEntries.append(gpaEntry)
    }
    
    func getEntry(atIndex index: Int) -> GPAEntry?   {
        return GPAEntries.element(at: index)
    }
    
}

extension Array {
    func element(at index: Int) -> Element? {
        if index < 0 { return nil }
        if index >= self.count { return nil }
        return self[index]
    }
}
