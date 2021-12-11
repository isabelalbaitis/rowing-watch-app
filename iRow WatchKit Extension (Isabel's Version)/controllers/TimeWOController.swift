//
//  TimeWOController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/10/21.
//

import UIKit
import WatchKit

class TimeWOController: WKInterfaceController {
    
    var isInterval: Bool?
    
    var minutes: Int?
    var seconds: Int?
    var totalTimeInSeconds: Int?
    
    @IBOutlet weak var rowOrSetRestButton: WKInterfaceButton!
    
    @IBOutlet weak var minutesHundPicker: WKInterfacePicker!
    @IBOutlet weak var minutesTensPicker: WKInterfacePicker!
    @IBOutlet weak var minutesOnesPicker: WKInterfacePicker!
    @IBOutlet weak var secondsTensPicker: WKInterfacePicker!
    @IBOutlet weak var secondsOnesPicker: WKInterfacePicker!
    
    @IBOutlet weak var workoutTitle: WKInterfaceLabel!
    
    let numberList: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let secTens: [Int] = [0, 1, 2, 3, 4, 5]
    
    // temporary variables for testing
    @IBOutlet weak var timeSetLabel: WKInterfaceLabel!
    
    var MinutesHundDigit: Int = 0
    var MinutesTensDigit: Int = 0
    var MinutesOnesDigit: Int = 0
    var SecondsTensDigit: Int = 0
    var SecondsOnesDigit: Int = 0
    
    override func awake(withContext context: Any?) {
        print("\nContext for TimeWOController on calling awake function: \(String(describing: context))")
        super.awake(withContext: context)
        print("Context for TimeWOController on calling super.awake function: \(String(describing: context))\n")
        
        if let selectedWorkout = context as? Int{
            workoutSelected(selectdType: selectedWorkout)
        }
        
        let numItems: [WKPickerItem] = numberList.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = "\($0)"
            return pickerItem
        }
        
        let tensItems: [WKPickerItem] = secTens.map{
            let pickerItem = WKPickerItem()
            pickerItem.title = "\($0)"
            return pickerItem
        }
        
        minutesHundPicker.setItems(numItems)
        minutesTensPicker.setItems(numItems)
        minutesOnesPicker.setItems(numItems)
        secondsTensPicker.setItems(tensItems)
        secondsOnesPicker.setItems(numItems)
        
        minutesHundPicker.setSelectedItemIndex(0)
        minutesTensPicker.setSelectedItemIndex(3)
        minutesOnesPicker.setSelectedItemIndex(0)
        secondsTensPicker.setSelectedItemIndex(0)
        secondsOnesPicker.setSelectedItemIndex(0)
        
        MinutesHundDigit = 0
        MinutesTensDigit = 3
        MinutesOnesDigit = 0
        SecondsTensDigit = 0
        SecondsOnesDigit = 0
        
        configureTime()
        
    }
 
    // MARK: - Functions
    func workoutSelected(selectdType: Int) {
        if selectdType == 0 {
            isInterval = false
            rowOrSetRestButton.setBackgroundColor(BRIGHT_GREEN)
            rowOrSetRestButton.setTitle("Row")
            workoutTitle.setText("Single Time")
        }
        if selectdType == 2 {
            isInterval = true
            rowOrSetRestButton.setBackgroundColor(PERFECT_YELLOW)
            rowOrSetRestButton.setTitle("Set Rest")
            workoutTitle.setText("Timed Intervals")
        }
    }
    
    func configureTime(){
        minutes = (MinutesHundDigit * 100) + (MinutesTensDigit * 10) + MinutesOnesDigit
        seconds = (SecondsTensDigit * 10) + SecondsOnesDigit
        totalTimeInSeconds = (minutes! * 60) + seconds!

        timeSetLabel.setText(String(format: "%d:%02d", minutes!, seconds!))
    }
    
    
    // MARK: - IBActions
    @IBAction func buttonPushed() {
        if isInterval == true {
            pushController(withName: "Set Rest", context: totalTimeInSeconds!)
        }
        else{
            pushController(withName: "WorkoutScreen", context: totalTimeInSeconds! * -1)
        }
        
    }
    
    @IBAction func minHundrChanged(_ value: Int) {
        MinutesHundDigit = value
        configureTime()
    }
    
    @IBAction func minTensChanged(_ value: Int) {
        MinutesTensDigit = value
        configureTime()
    }
    
    @IBAction func minOnesChanged(_ value: Int) {
        MinutesOnesDigit = value
        configureTime()
    }
    
    @IBAction func secTensChanged(_ value: Int) {
        SecondsTensDigit = value
        configureTime()
    }
    
    @IBAction func secOnesChanged(_ value: Int) {
        SecondsOnesDigit = value
        configureTime()
    }
    
    
}
