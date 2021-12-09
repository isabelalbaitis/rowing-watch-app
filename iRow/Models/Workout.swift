//
//  Workout.swift
//  iRow
//
//  Created by Jake Stone on 12/8/21.
//

import Foundation

struct Workout {
    var key : String?
    var type : String? // single or interval, time or distance
    var location : String? // city, ST
    var date : Date? // MM/DD/YY format
    var timeOfDay : Double? // time of day
    var meters : Double? // total meters rowed
    var split : Double? // avg 500m split
    var totalTime : Double? //

    init(key: String?, type: String?, location: String?, date: Date?,
         timeOfDay : Double?, meters: Double?, split: Double?, totalTime: Double?)
    {
        self.key = key
        self.type = type
        self.location = location
        self.date = date
        self.timeOfDay = timeOfDay
        self.meters = meters
        self.split = split
        self.totalTime = totalTime
    }
    
    init(type: String?, location: String?, date: Date?, timeOfDay : Double?,
         meters: Double?, split: Double?, totalTime: Double?)
    {
        self.init(key: nil, type: type, location: location, date: date,
                  timeOfDay: timeOfDay, meters: meters, split: split, totalTime: totalTime)
    }
    
    init() {
        self.init(key: nil, type: nil, location: nil, date: nil, timeOfDay: nil,
                  meters: nil, split: nil, totalTime: nil)
    }
    
}
