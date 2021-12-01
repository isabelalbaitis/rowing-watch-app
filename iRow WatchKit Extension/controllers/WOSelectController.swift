//
//  WOSelectController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import UIKit
import WatchKit


class WOSelectController: WKInterfaceController {
    
    var NewWorkout : Workout?
    
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
        selectedWorkoutIndex = rowIndex
        if selectedWorkoutIndex == 0 {
            NewWorkout = Workout(isInterval: false, isDistance: false)
        }
        if selectedWorkoutIndex == 1 {
            NewWorkout = Workout(isInterval: false, isDistance: true)
        }
        if selectedWorkoutIndex == 2 {
            NewWorkout = Workout(isInterval: true, isDistance: false)
        }
        if selectedWorkoutIndex == 3 {
            NewWorkout = Workout(isInterval: true, isDistance: true)
        }
        
        pushController(withName: "Configure Workout", context: NewWorkout)
        
        
    }
    
}
