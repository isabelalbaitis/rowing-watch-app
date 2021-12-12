//
//  WOSelectController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import UIKit
import WatchKit


class WOSelectController: WKInterfaceController {
        
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
            let row = workoutTypeTable.rowController(at: index) as! NewWORowController
            row.typeLabel?.setText(labelText)
        }
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        
        print(rowIndex)
        
        var workout: PracticePlan
        
        if rowIndex == 0 {
            // Single Time
            workout = PracticePlan(isInterval: false, isDistance: false)
            pushController(withName: "Configure Workout", context: workout)
        }
        else if rowIndex == 1 {
            // Single Distance
            workout = PracticePlan(isInterval: false, isDistance: true)
            pushController(withName: "Configure Workout", context: workout)
        }
        else if rowIndex == 2 {
            // Time Intervals
            workout = PracticePlan(isInterval: true, isDistance: false)
            pushController(withName: "Configure Workout", context: workout)
        }
        else {
        //else if rowIndex == 3 {
            // Distance Intervals
            workout = PracticePlan(isInterval: true, isDistance: true)
            pushController(withName: "Configure Workout", context: workout)
        }
        
    }

    
}
