//
//  SetRestController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 11/30/21.
//

import UIKit
import WatchKit

class SetRestController: WKInterfaceController {
    
    var NewWorkout : Workout?
    
    var minutes: Int?
    var seconds: Int?
    var totalTimeInSeconds: Int?
    var intervalWorkLength: Int?
            
    @IBOutlet weak var rowButton: WKInterfaceButton!
    
    @IBOutlet weak var minutesHundPicker: WKInterfacePicker!
    @IBOutlet weak var minutesTensPicker: WKInterfacePicker!
    @IBOutlet weak var minutesOnesPicker: WKInterfacePicker!
    @IBOutlet weak var secondsTensPicker: WKInterfacePicker!
    @IBOutlet weak var secondsOnesPicker: WKInterfacePicker!
    
    @IBOutlet weak var workoutTitle: WKInterfaceLabel!
    
    let numberList: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let secTens: [Int] = [0, 1, 2, 3, 4, 5]
    
    // temporary variables for testing
    @IBOutlet weak var restSetLabel: WKInterfaceLabel!
    @IBOutlet weak var workLengthLabel: WKInterfaceLabel!
    
    var MinutesHundDigit: Int = 0
    var MinutesTensDigit: Int = 0
    var MinutesOnesDigit: Int = 0
    var SecondsTensDigit: Int = 0
    var SecondsOnesDigit: Int = 0
    
    override func awake(withContext context: Any?) {
        
        NewWorkout! = (context as? Workout)!
        
        super.awake(withContext: context)
        
        rowButton.setBackgroundColor(BRIGHT_GREEN)
        
        if NewWorkout!.isDistance == true{
            workLengthLabel.setText(String(format: "%d m", NewWorkout!.distIntervalLength!))
        }
        else if NewWorkout!.isDistance == false{
            workLengthLabel.setText(String(format: "%d:%02d", Int(NewWorkout!.timeIntervalLength! / 60), Int(NewWorkout!.timeIntervalLength!) % 60))
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
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "Rest to WO Interface"{
            return NewWorkout
        }
        
        return nil
    }
    

    // MARK: - Functions
    /*
    func getWorkoutType(from workLength: Int) {
        if workLength < 0 {
            // This is a timed interval workout
            // workLength is the total number of seconds
            intervalWorkLength = workLength * -1
            let displaySeconds = intervalWorkLength! % 60
            let displayMinutes = (intervalWorkLength! - displaySeconds) / 60
            
            workLengthLabel.setText(String(format: "%d:%02d", displayMinutes, displaySeconds))
        }
        else{
            if workLength > 1000{
                let workDistInKM: Double = Double(workLength) / 1000
                workLengthLabel.setText(String(format: "%.3d km", workDistInKM))
            }
            else{
                workLengthLabel.setText(String(format: "%d m", workLength))
            }
        }
    }
     */
    
    func configureTime(){
        minutes = (MinutesHundDigit * 100) + (MinutesTensDigit * 10) + MinutesOnesDigit
        seconds = (SecondsTensDigit * 10) + SecondsOnesDigit
        totalTimeInSeconds = (minutes! * 60) + seconds!

        NewWorkout?.intervalRestTime = Double(totalTimeInSeconds!)
        restSetLabel.setText(String(format: "%d:%02d", minutes!, seconds!))
    }
    
    
    // MARK: - IBActions
    @IBAction func buttonPushed() {
        rowButton.setBackgroundColor(BEST_BLUE)
        
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