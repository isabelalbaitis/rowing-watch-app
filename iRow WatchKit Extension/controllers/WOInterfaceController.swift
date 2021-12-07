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
    
   // var backgroundTimer = Timer()
    
//    let ALL_DONE: WKInterfaceTimer
    
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
        
        switch(CurrentWorkout?.type){
        case Workout.SINGLE_TIME:
            workoutTitle.setText("Single Time")
            seconds = (CurrentWorkout?.pieceTotalSeconds)!
            setUpTimedWorkout(seconds: seconds)
            break
        case Workout.SINGLE_DISTANCE:
            workoutTitle.setText("Single Distance")
            dist = (CurrentWorkout?.pieceDistanceMeters)!
            setUpDistanceWorkout(distance: dist)
            break
        case Workout.TIME_INTERVAL:
            workoutTitle.setText("Time Interval")
            seconds = (CurrentWorkout?.pieceTotalSeconds)!
            setUpTimedWorkout(seconds: seconds)
            break
        case Workout.DISTANCE_INTERVAL:
            workoutTitle.setText("Distance Interval")
            dist = (CurrentWorkout?.pieceDistanceMeters)!
            setUpDistanceWorkout(distance: dist)
            break
        default:
            break
        }
        
      
        
    }
    
    func setUpTimedWorkout(seconds: Double){
        meters.setHidden(true)
     //   backgroundTimer = Timer.i
        timer.setDate(NSDate(timeIntervalSinceNow: seconds) as Date)
        timer.start()
    }
    
    func setUpDistanceWorkout(distance: Int){
        timer.setHidden(true)
        meters.setText(String(format: "%d m", distance))
    }
    
    
}
