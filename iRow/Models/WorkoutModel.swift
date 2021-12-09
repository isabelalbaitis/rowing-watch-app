//
//  WorkoutModel.swift
//  iRow
//
//  Created by Jake Stone on 12/8/21.
//

import Foundation

class WorkoutModel {
    fileprivate var items : [Workout] = [Workout]()
    
    init() {
        createList()
    }
    
    func getWorkouts() -> [Workout]
    {
        return self.items
    }
    
    fileprivate func createList()
    {
        items.append(Workout(type: "Single Distnace", location: "Allendale, MI", date: "12/12/21", timeOfDay: 9, meters: 10000, split: 1.59, totalTime: 39.9))
    }
