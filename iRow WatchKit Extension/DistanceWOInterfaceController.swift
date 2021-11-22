//
//  DistanceWOInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 11/11/21.
//

import UIKit
import WatchKit

class DistanceWOInterfaceController: WKInterfaceController {
    
    var isInterval: Bool?
    
    @IBOutlet weak var rowOrSetRestButton: WKInterfaceButton!
    
    @IBOutlet weak var tenThousPicker: WKInterfacePicker!
    @IBOutlet weak var oneThousPicker: WKInterfacePicker!
    @IBOutlet weak var hundredsPicker: WKInterfacePicker!
    @IBOutlet weak var tensPicker: WKInterfacePicker!
    @IBOutlet weak var onesPicker: WKInterfacePicker!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let selectedWorkout = context as? Int{
            workoutSelected(selectdType: selectedWorkout)
        }
    }
 
    
    func workoutSelected(selectdType: Int) {
        if selectdType == 1 {
            isInterval = false
            rowOrSetRestButton.setBackgroundColor(BRIGHT_GREEN)
            rowOrSetRestButton.setTitle("Row")
        }
        if selectdType == 3 {
            isInterval = true
            rowOrSetRestButton.setBackgroundColor(PERFECT_YELLOW)
            rowOrSetRestButton.setTitle("Set Rest")
        }
    }

}
