//
//  OnWaterRow.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/1/21.
//

import Foundation

struct OnWaterRow {
    
    var workout: Workout
    var numIntervals: Int
    var totalWorkTime: TimeInterval
    var totalWorkDistance: Int
    var avgSplit: TimeInterval
    var strokeRate: Int
    
    init(workout: Workout){
        self.workout = workout
    }
    
}
