//
//  PracticePlan.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import Foundation

/* Structure that defines a Plan by:
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
struct PracticePlan {
    
    // Only types of Plans allowed
    static let SINGLE_TIME: Int = 0
    static let SINGLE_DISTANCE: Int = 1
    static let TIME_INTERVAL: Int = 2
    static let DISTANCE_INTERVAL: Int = 3
    
    let type: Int
    var pieceTotalSeconds: TimeInterval?
    var pieceDistanceMeters: Int?
    var restTotalSeconds: TimeInterval?

    
    init(isInterval: Bool, isDistance: Bool) {
        
        if isInterval == false && isDistance == false   { type = PracticePlan.SINGLE_TIME }
        
        else if isInterval == false && isDistance == true    { type = PracticePlan.SINGLE_DISTANCE }
        
        else if isInterval == true && isDistance == false    { type = PracticePlan.TIME_INTERVAL }
        
        else if isInterval == true && isDistance == true     { type = PracticePlan.DISTANCE_INTERVAL}
        
        else    { type = -1 }
        
        pieceTotalSeconds = 0
        pieceDistanceMeters = 0
        restTotalSeconds = 0
    
    }
    
    init(type: Int, pieceSeconds: TimeInterval, pieceMeters: Int, restSeconds: TimeInterval){
        
        self.type = type
        
        if type == 1 || type == 3 {
            pieceDistanceMeters = pieceMeters
            pieceTotalSeconds = 0
        }
        else {
            pieceDistanceMeters = 0
            pieceTotalSeconds = pieceSeconds
        }
        
        if type > 1 { restTotalSeconds = 0 } else { restTotalSeconds = restSeconds }
        
    }
    
}
