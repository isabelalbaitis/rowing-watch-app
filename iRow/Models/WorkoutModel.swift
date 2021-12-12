//
//  WorkoutModel.swift
//  iRow
//
//  Created by Jake Stone on 12/1/21.
//

import Foundation
import WatchConnectivity

class WorkoutModel {
    fileprivate var items: [Workout] = [Workout]()
    
    init()
    {
        createList()
    }
    
    func getWorkouts() -> [Workout]
    {
        return self.items
    }
    
    fileprivate func createList()
    {
        items.append(
                Workout( // single distance
                    type: 1,
                    date: Date.distantPast,
                    meters: 10500,
                    rest: 0,
                    totalTime: 2520)
            )
        items.append(
            Workout( // single time
                    type: 0,
                    date: Date.distantPast,
                    meters: 15000,
                    rest: 0,
                    totalTime: 3600)
            )
        items.append(
                Workout( //interval time
                    type: 2,
                    date: Date.distantPast,
                    meters: 0,
                    rest: 180,
                    totalTime: 1200)
            )
        
        items.append(
                Workout( // distance interval
                    type: 3,
                    date: Date.distantPast,
                    meters: 12750,
                    rest: 240,
                    totalTime: 0)
            )
    }
}
