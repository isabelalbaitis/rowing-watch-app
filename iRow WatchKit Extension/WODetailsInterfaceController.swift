//
//  WODetailsInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 11/10/21.
//

import UIKit
import WatchKit

class WODetailsInterfaceController: WKInterfaceController {
    
    @IBOutlet weak var timeOrDistance: WKInterfaceLabel!
    @IBOutlet weak var singleOrInterval: WKInterfaceLabel!
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let selectedWorkout = context as? Int{
            workoutSelected(selectdType: selectedWorkout)
        }
    }
 
    
    func workoutSelected(selectdType: Int) {
        if selectdType == 0 {
            timeOrDistance.setText("Time")
            singleOrInterval.setText("Single")
        }
        if selectdType == 1 {
            timeOrDistance.setText("Distance")
            singleOrInterval.setText("Single")
        }
        if selectdType == 2 {
            timeOrDistance.setText("Time")
            singleOrInterval.setText("Interval")
        }
        if selectdType == 3 {
            timeOrDistance.setText("Distance")
            singleOrInterval.setText("Interval")
        }
    }
    
}
