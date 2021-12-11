//
//  OnWaterRow.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/1/21.
//
import HealthKit
import FitnessUnits
import FitDataProtocol
import Foundation
//import WatchConnectivity

class OnWaterRow{
    
    var rowingWorkout: HKWorkout
    var workoutMetaData: [String: Double]
    
    var spm: Double
    var split: TimeInterval
    
    init(rowWO: HKWorkout){
        rowingWorkout = rowWO
        spm = 28.0
        split = (rowWO.duration as Double / rowWO.totalDistance!.doubleValue(for: HKUnit.meter())) * 500 as TimeInterval
        workoutMetaData = ["spm" : spm, "split": split]
    }
    
}

