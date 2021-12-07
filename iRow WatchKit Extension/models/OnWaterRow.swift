//
//  OnWaterRow.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/1/21.
//

import Foundation

struct OnWaterRow {
    
    var workout: Workout
    var numIntervals: Int?
    
    var totalWorkTime: TimeInterval
    var totalWorkDistance: Int
    
    var avgSplit: TimeInterval?
    var strokeRate: Int?
    
    // Initializer for timed pieces
    init(timedWorkout: Workout, repetitions: Int, workMeters: Int){
        
        workout = timedWorkout
        numIntervals = repetitions
        totalWorkDistance = workMeters
        totalWorkTime = ((timedWorkout.pieceTotalSeconds! as Double) * Double(repetitions)) as TimeInterval
        
        avgSplit = findAverageSplit(distanceWorkedTotal: workMeters, timeTotalWorked: totalWorkTime)
        
        
        
    }
    
    // Initializer for distance pieces
    init(distanceWorkout: Workout, numintervals reps: Int, totalWorkTime workSeconds: TimeInterval){
        
        workout = distanceWorkout
        numIntervals = reps
        totalWorkTime = workSeconds
        totalWorkDistance = distanceWorkout.pieceDistanceMeters! * reps
        
        
        avgSplit = findAverageSplit(distanceWorkedTotal: distanceWorkout.pieceDistanceMeters! * reps, timeTotalWorked: totalWorkTime)
        
    }
    
    
    // Computes average split for entire workout
    func findAverageSplit(distanceWorkedTotal meters: Int, timeTotalWorked seconds: TimeInterval) -> TimeInterval{
       
        let averageSplit: TimeInterval = (seconds * 500) / Double(meters)
        return averageSplit
    }
    
    
}
