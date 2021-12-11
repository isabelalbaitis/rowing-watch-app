//
//  Workout.swift
//  iRow
//
//  Created by Jake Stone on 12/8/21.
//

import Foundation


struct Workout {
    var key : String?
    var type : Int? // single or interval, time or distance
    var date : Date? // MM/DD/YY format
    var meters : Int? // total meters rowed
    var rest : TimeInterval? // avg 500m split
    var totalTime : TimeInterval? //

    init(key: String?, type: Int?, date: Date?, meters: Int?, rest: Double?, totalTime: Double?)
    {
        self.key = key
        self.type = type
        self.date = date
        self.meters = meters
        self.rest = rest
        self.totalTime = totalTime
    }
    
    init(type: Int?, date: Date?,
         meters: Int?, rest: Double?, totalTime: Double?)
    {
        self.init(key: nil, type: type,  date: date,
                   meters: meters, rest: rest, totalTime: totalTime)
    }
    
    init() {
        self.init(key: nil, type: nil, date: nil,
                  meters: nil, rest: nil, totalTime: nil)
    }
    
}
