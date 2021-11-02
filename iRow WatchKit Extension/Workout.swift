//
//  Workout.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 11/2/21.
//

import Foundation

struct Workout {
    var distance : Double
    var totalTime : TimeInterval
    var split : TimeInterval
    var strokeRate : Int
    var dateTimeCompleted : Date
    
    init(distance: Double, totalTime: TimeInterval, strokeRate: Int, dateTimeCompleted: Date) {
        self.distance = distance
        self.totalTime = totalTime
        self.strokeRate = strokeRate
        self.dateTimeCompleted = dateTimeCompleted
        self.split = (self.totalTime/self.distance) * 500.0
    }
}
