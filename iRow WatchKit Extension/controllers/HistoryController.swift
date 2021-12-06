//
//  HistoryController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/6/21.
//

import UIKit
import WatchKit

class HistoryController: WKInterfaceController {
    
    @IBOutlet weak var historyTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadtable()
    }
    
    func loadtable(){
        historyTable.setNumberOfRows(10, withRowType: "history row")
    }
    
    func addToTable(completedWorkout: Workout){
        historyTable.insertRows(at: IndexSet(integer: 0), withRowType: "history row")
        historyTable.removeRows(at: IndexSet(integer: 10))
    }

}
