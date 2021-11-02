//
//  NewWorkoutInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 11/2/21.
//

import UIKit
import WatchKit

class NewWorkoutInterfaceController: WKInterfaceController {
    
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
            row.typeLabel.setText(labelText)
        }
    }
    
}
