//
//  SetRestController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 11/30/21.
//

import UIKit
import WatchKit

class SetRestController: WKInterfaceController {
    
    var workout : Workout?
    
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
        
        print ("\nFrom SetRestController, context:")
        print (String(describing: context))
        
        workout = context as! Workout?
        
        print ("\nFrom SetRestController, workout:")
        print (String(describing: workout))
        
        super.awake(withContext: context)
        
        rowButton.setBackgroundColor(BRIGHT_GREEN)
        
        if workout?.isDistance == true{
            workLengthLabel.setText(String(format: "%d m", workout!.pieceDistanceMeters!))
        }
        else if workout?.isDistance == false{
            workLengthLabel.setText(String(format: "%d:%02d", Int(workout!.pieceTotalSeconds! / 60), Int(workout!.pieceTotalSeconds!) % 60))
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
        minutesTensPicker.setSelectedItemIndex(0)
        minutesOnesPicker.setSelectedItemIndex(1)
        secondsTensPicker.setSelectedItemIndex(0)
        secondsOnesPicker.setSelectedItemIndex(0)
        
        MinutesHundDigit = 0
        MinutesTensDigit = 0
        MinutesOnesDigit = 1
        SecondsTensDigit = 0
        SecondsOnesDigit = 0
        
        configureTime()
    
    }
    
    override func contextForSegue(withIdentifier segueIdentifier: String) -> Any? {
        if segueIdentifier == "Rest to WO Interface"{
            return workout
        }
        
        return nil
    }
    

    // MARK: - Functions
    
    func configureTime(){
        minutes = (MinutesHundDigit * 100) + (MinutesTensDigit * 10) + MinutesOnesDigit
        seconds = (SecondsTensDigit * 10) + SecondsOnesDigit
        totalTimeInSeconds = (minutes! * 60) + seconds!

        workout?.restTotalSeconds = Double(totalTimeInSeconds!)
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
    
    override func contextsForSegue(withIdentifier segueIdentifier: String) -> [Any]? {
        return [workout!, workout!]
    }


}
