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
    
    /*
    init(TYPE_CONSTANT: Int){
        self.type = TYPE_CONSTANT
        
        switch self.type{
        case Workout.SINGLE_TIME:
            isInterval = false
            isDistance = false
            break
        case Workout.SINGLE_DISTANCE:
            isInterval = false
            isDistance = true
            break
        case Workout.TIME_INTERVAL:
            isInterval = true
            isDistance = false
            break
        case Workout.DISTANCE_INTERVAL:
            isInterval = true
            isDistance = false
            break
        default:
            break
        }
        
    }
    */
    
    
    
    
    
}
