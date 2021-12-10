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
                Workout(
                    type: "Single Distance",
                    location: "Allendale, MI",
                    date: Date.distantPast,
                    timeOfDay: 900,
                    meters: 10500,
                    split: 1.59,
                    totalTime: 39.8)
            )
    }
}
