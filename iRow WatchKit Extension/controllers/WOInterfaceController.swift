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
    

    // PRESENT THIS MODALLY?
    override func awake(withContext context: Any?) {
        
        CurrentWorkout = context as! Workout?
        
        super.awake(withContext: context)
                        
        if CurrentWorkout?.type == Workout.SINGLE_TIME{
            print("Single Time")
            workoutTitle.setText("Single Time")
        }
        else if CurrentWorkout?.type == Workout.SINGLE_DISTANCE{
            print("Single Distance")
            workoutTitle.setText("Single Distance")
        }
        else if CurrentWorkout?.type == Workout.TIME_INTERVAL{
            print("Time Intervals")
            workoutTitle.setText("Time Interval")
        }
        else if CurrentWorkout?.type == Workout.DISTANCE_INTERVAL{
            print("Distance Interval")
            workoutTitle.setText("Distance Interval")
        }
        else {
            print("Piss baby")
        }
        
    }
    
    
}
