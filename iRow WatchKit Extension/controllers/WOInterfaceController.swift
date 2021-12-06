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
    @IBOutlet weak var meters: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        
        CurrentWorkout = context as! Workout?
        var seconds: Double = -2
        var dist: Int = -2
        
        super.awake(withContext: context)
                        
        if CurrentWorkout?.type == Workout.SINGLE_TIME{
            workoutTitle.setText("Single Time")
            seconds = (CurrentWorkout?.pieceTotalSeconds)!
            setUpTimedWorkout(seconds: seconds)
        }
        else if CurrentWorkout?.type == Workout.SINGLE_DISTANCE{
            workoutTitle.setText("Single Distance")
            dist = (CurrentWorkout?.pieceDistanceMeters)!
            setUpDistanceWorkout(distance: dist)
        }
        else if CurrentWorkout?.type == Workout.TIME_INTERVAL{
            print((CurrentWorkout?.pieceTotalSeconds!)! as Double)
            workoutTitle.setText("Time Interval")
            seconds = (CurrentWorkout?.pieceTotalSeconds)!
            setUpTimedWorkout(seconds: seconds)
        }
        else if CurrentWorkout?.type == Workout.DISTANCE_INTERVAL{
            print(Double((CurrentWorkout?.pieceDistanceMeters)!))
            workoutTitle.setText("Distance Interval")
            dist = (CurrentWorkout?.pieceDistanceMeters)!
            setUpDistanceWorkout(distance: dist)
        }
        
        print(seconds)
        print(dist)
        
    }
    
    func setUpTimedWorkout(seconds: Double){
        meters.setHidden(true)
        timer.setDate(NSDate(timeIntervalSinceNow: seconds) as Date)
        timer.start()
    }
    
    func setUpDistanceWorkout(distance: Int){
        timer.setHidden(true)
        meters.setText(String(format: "%d m", distance))
    }
    
    
}
