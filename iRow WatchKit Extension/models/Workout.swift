//
//  Workout.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import Foundation

struct Workout {
    
    static let SINGLE_TIME: Int = 0
    static let SINGLE_DISTANCE: Int = 1
    static let TIME_INTERVAL = 2
    static let DISTANCE_INTERVAL = 3
    
    let type : Int?
    
    var isInterval : Bool
    var isDistance : Bool
    
    var distance : Double?
    var totalTime : TimeInterval?
    var split : TimeInterval?
    var strokeRate : Int?
    var dateTimeCompleted : Date?
    
    init(isInterval: Bool, isDistance: Bool) {
        self.isInterval = isInterval
        self.isDistance = isDistance
        
        if self.isInterval == false && self.isDistance == false{
            self.type = Workout.SINGLE_TIME
        }
        else if self.isInterval == false && self.isDistance == true{
            self.type = Workout.SINGLE_DISTANCE
        }
        else if self.isInterval == true && self.isDistance == false{
            self.type = Workout.TIME_INTERVAL
        }
        else if self.isInterval == true && self.isDistance == true{
            self.type = Workout.DISTANCE_INTERVAL
        }
        else{
            self.type = nil
        }
        
    }
    
    /*
    init(distance: Double, totalTime: TimeInterval, strokeRate: Int, dateTimeCompleted: Date) {
        self.distance = distance
        self.totalTime = totalTime
        self.strokeRate = strokeRate
        self.dateTimeCompleted = dateTimeCompleted
        self.split = (self.totalTime / self.distance) * 500.0 ?? nil
    }
     */
}
