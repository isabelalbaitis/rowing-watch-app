//
//  NewWorkoutInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 11/2/21.
//

import UIKit
import WatchKit


class WOSelectionInterfaceController: WKInterfaceController {
    
    var selectedWorkoutIndex: Int = -1
    
    @IBOutlet weak var workoutTypeTable: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        loadTable()
    }
    
    let types = ["Single Time", "Single Distance", "Time Intervals", "Distance Intervals"]

    func loadTable(){
        workoutTypeTable.setNumberOfRows(types.count, withRowType: "New Workout Row Controller")
        
        for (index, labelText) in types.enumerated(){
            let row = workoutTypeTable.rowController(at: index) as! NewWorkoutRowController
            row.typeLabel?.setText(labelText)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        selectedWorkoutIndex = rowIndex
        
        if rowIndex == 0 || rowIndex == 2 {
            pushController(withName: "TimeWorkoutSelector", context: selectedWorkoutIndex)
        }
        
        if rowIndex == 1 || rowIndex == 3 {
            pushController(withName: "DistanceWorkoutSelector", context: selectedWorkoutIndex)
        }
        
        
        
    }
    
}
