//
//  Workout.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import Foundation

/* Structure that defines a Workout by:
    - isInterval: Repetition of piece(s) (one or many)
        First of the two Bool values that determine type
    - isDistance: Metric piece(s) are based on (time or distance)
        Second of the two Bool values that determine type
    - Either:
            + pieceDistanceMeters: Length of each piece in meters (distance), -1 on error
        or
            + pieceTotalSeconds: Duration of each piece in seconds (time), -1 on error
    - restTotalSeconds: Number of seconds between pieces, nil if piece is singular
 */
struct Workout {
    
    // Only types of Workouts allowed
    static let SINGLE_TIME: Int = 0
    static let SINGLE_DISTANCE: Int = 1
    static let TIME_INTERVAL: Int = 2
    static let DISTANCE_INTERVAL: Int = 3
    
    var isInterval: Bool
    var isDistance: Bool
    
    let type: Int
    
    var pieceTotalSeconds: TimeInterval?
    var pieceDistanceMeters: Int?
    
    var restTotalSeconds: TimeInterval?
    
    var description: String?

    
    init(isInterval: Bool, isDistance: Bool) {
        self.isInterval = isInterval
        self.isDistance = isDistance
        
        if self.isInterval == false{
            restTotalSeconds = nil
            
            if self.isDistance == false {
                type = Workout.SINGLE_TIME
                pieceTotalSeconds = 0
                pieceDistanceMeters = nil
                
            }
            else {
                type = Workout.SINGLE_DISTANCE
                pieceTotalSeconds = nil
                pieceDistanceMeters = 0
            }
        }
        else {
            restTotalSeconds = 0
            
            if self.isDistance == false {
                type = Workout.TIME_INTERVAL
                pieceTotalSeconds = 0
                pieceDistanceMeters = nil
            }
            else {
                type = Workout.DISTANCE_INTERVAL
                pieceTotalSeconds = nil
                pieceDistanceMeters = 0
            }
        }
    }
    
    mutating func formatDescription(){
        if isInterval == false {
            if isDistance == false {
                let m = Int(pieceTotalSeconds! as Double) / 60
                let s = Int(pieceTotalSeconds! as Double) % 60
                if s > 0 {
                    description = String(format: "%d min., %d sec.", m, s)
                }
                else{
                    description = String(format: "%d minute", m)
                }
            }
            if isDistance == true {
                description = String(format: "%d meters", pieceDistanceMeters!)
            }
        }
        if isInterval == true {
            if isDistance == false {
                let r = restTotalSeconds! as Double / 60
                let m = Int(pieceTotalSeconds! as Double) / 60
                let s = Int(pieceTotalSeconds! as Double) % 60
                if s > 0 {
                    description = String(format: "%d min., %d sec.; %d' r", m, s, r)
                }
                else{
                    description = String(format: "%d minute; %d' r", m, r)
                }
            }
            if isDistance == true {
                let r = restTotalSeconds! as Double / 60
                description = String(format: "%d meters; %d' r", pieceDistanceMeters!, r)
            }
        }
    }
    
    
}
