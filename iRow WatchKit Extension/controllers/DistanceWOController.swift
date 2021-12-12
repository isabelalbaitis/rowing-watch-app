//
//  DistanceWOInterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/11/21.
//

import UIKit
import WatchKit

class DistanceWOController: WKInterfaceController {
    
    var isInterval: Bool?
    
    @IBOutlet weak var rowOrSetRestButton: WKInterfaceButton!
    
    @IBOutlet weak var tenThousPicker: WKInterfacePicker!
    @IBOutlet weak var oneThousPicker: WKInterfacePicker!
    @IBOutlet weak var hundredsPicker: WKInterfacePicker!
    @IBOutlet weak var tensPicker: WKInterfacePicker!
    @IBOutlet weak var onesPicker: WKInterfacePicker!
    
    var numberList: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        if let selectedWorkout = context as? Int{
            workoutSelected(selectdType: selectedWorkout)
        }
        let numItems: [WKPickerItem] = numberList.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = "\($0)"
            return pickerItem
        }
        tenThousPicker.setItems(numItems)
        oneThousPicker.setItems(numItems)
        hundredsPicker.setItems(numItems)
        tensPicker.setItems(numItems)
        onesPicker.setItems(numItems)
        
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
