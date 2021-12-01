//
//  WOInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/1/21.
//

import UIKit
import WatchKit

class WOInterfaceController: WKInterfaceController {
    
    var CurrentWorkout : Workout?
    
    @IBOutlet weak var workoutTitle: WKInterfaceLabel!
    @IBOutlet weak var timer: WKInterfaceTimer!
    @IBOutlet weak var date: WKInterfaceDate!
    @IBOutlet weak var strokeRate: WKInterfaceLabel!
    

    // PRESENT THIS MODALLY
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        CurrentWorkout = context as! Workout?
        
        if CurrentWorkout?.type == Workout.SINGLE_TIME{
            workoutTitle.setText("Single Time")
        }
        else if CurrentWorkout?.type == Workout.SINGLE_DISTANCE{
            workoutTitle.setText("Single Distance")
        }
        else if CurrentWorkout?.type == Workout.TIME_INTERVAL{
            workoutTitle.setText("Time Interval")
        }
        else if CurrentWorkout?.type == Workout.DISTANCE_INTERVAL{
            workoutTitle.setText("Distance Interval")
        }
        
        
    }
    
    
}
