//
//  WOConfigureController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/1/21.
//

import UIKit
import WatchKit

class WOConfigureController: WKInterfaceController {
    
    var NewWorkout: PracticePlan?
        
    var minutes: Int?
    var seconds: Int?
    
    // Total length in seconds of one interval (entire workout if single time)
    var totalTimeInSeconds: Int?

    // Total distance in meters of one interval (entire workout if single distance)
    var totalDistanceInMeters: Int?

    
    @IBOutlet weak var setRestButton: WKInterfaceButton!
    @IBOutlet weak var rowButton: WKInterfaceButton!
    
    let numberList: [Int] = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
    let secTens: [Int] = [0, 1, 2, 3, 4, 5]

    @IBOutlet weak var workoutTitle: WKInterfaceLabel!
    @IBOutlet weak var setLabel: WKInterfaceLabel!
    
    @IBOutlet weak var TimePickerGroup: WKInterfaceGroup!
    @IBOutlet weak var DistPickerGroup: WKInterfaceGroup!

    @IBOutlet weak var minutesHundPicker: WKInterfacePicker!
    @IBOutlet weak var minutesTensPicker: WKInterfacePicker!
    @IBOutlet weak var minutesOnesPicker: WKInterfacePicker!
    @IBOutlet weak var secondsTensPicker: WKInterfacePicker!
    @IBOutlet weak var secondsOnesPicker: WKInterfacePicker!
    
    @IBOutlet weak var distTenThousPicker: WKInterfacePicker!
    @IBOutlet weak var distOneThousPicker: WKInterfacePicker!
    @IBOutlet weak var distHundPicker: WKInterfacePicker!
    @IBOutlet weak var distTensPicker: WKInterfacePicker!
    @IBOutlet weak var distOnesPicker: WKInterfacePicker!
    

    // temporary variables for testing
    @IBOutlet weak var workSetLabel: WKInterfaceLabel!

    var MinutesHundDigit: Int = 0
    var MinutesTensDigit: Int = 0
    var MinutesOnesDigit: Int = 0
    var SecondsTensDigit: Int = 0
    var SecondsOnesDigit: Int = 0
    
    var DTenThousDigit: Int = 0
    var DOneThousDigit: Int = 0
    var DHundDigit: Int = 0
    var DTensDigit: Int = 0
    var DOnesDigit: Int = 0
    
    
    
    override func awake(withContext context: Any?) {
        
        print("From WOConfigureController, context:")
        print(String(describing: context))

        NewWorkout = (context as! PracticePlan)
        
        print("From WOConfigureController, NewWorkout:")
        print(String(describing: NewWorkout))

        super.awake(withContext: context)
        
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
        
        configForSelection()
            
        if (NewWorkout?.type)! > 1 {
            setRestButton.setBackgroundColor(PERFECT_YELLOW)
            setRestButton.setHidden(false)
        }
        if (NewWorkout?.type)! < 2 {
            rowButton.setBackgroundColor(BRIGHT_GREEN)
            rowButton.setHidden(false)
        }
        if (NewWorkout?.type)! % 2 == 1 {
            DistPickerGroup.setHidden(false)
                
            // Populating Meter Selection Pickers
            distTenThousPicker.setItems(numItems)
            distOneThousPicker.setItems(numItems)
            distHundPicker.setItems(numItems)
            distTensPicker.setItems(numItems)
            distOnesPicker.setItems(numItems)
            
                
            // Setting a Default Selected Distance (2000 Meters)
            // Selecting Default Values for Meter Pickers
            distTenThousPicker.setSelectedItemIndex(0)
            distOneThousPicker.setSelectedItemIndex(2)
            distHundPicker.setSelectedItemIndex(0)
            distTensPicker.setSelectedItemIndex(0)
            distOnesPicker.setSelectedItemIndex(0)
            
            // Assigning Default Values to Meter Selection Variables
            DTenThousDigit = 0
            DOneThousDigit = 2
            DHundDigit = 0
            DTensDigit = 0
            DOnesDigit = 0
                
            configureDist()
        }
        if (NewWorkout?.type)! % 2 == 0 {
                TimePickerGroup.setHidden(false)
                
                // Populating Time Selection Pickers
                minutesHundPicker.setItems(numItems)
                minutesTensPicker.setItems(numItems)
                minutesOnesPicker.setItems(numItems)
                secondsTensPicker.setItems(tensItems)
                secondsOnesPicker.setItems(numItems)
                
                // Setting a Defualt Selected Time (30 Minutes)
                // Selecting Default Values for Time Pickers
                minutesHundPicker.setSelectedItemIndex(0)
                minutesTensPicker.setSelectedItemIndex(3)
                minutesOnesPicker.setSelectedItemIndex(0)
                secondsTensPicker.setSelectedItemIndex(0)
                secondsOnesPicker.setSelectedItemIndex(0)
                
                // Assigning Default Values to Time Selection Variables
                MinutesHundDigit = 0
                MinutesTensDigit = 3
                MinutesOnesDigit = 0
                SecondsTensDigit = 0
                SecondsOnesDigit = 0
                
                configureTime()
            }
        
        
    }
    
 
    // MARK: - Functions
    
    // Sets global variables 'isInterval' and 'isDistance' to respective values
    // Sets text for displayed labels
    // Shows relevant pickers and buttons
    func configForSelection() {
        // Single Time
        if NewWorkout?.type == PracticePlan.SINGLE_TIME {
            workoutTitle.setText("Single Time")
            setLabel.setText("Set Time:")
        }
        
        // Single Distance
        if NewWorkout?.type == PracticePlan.SINGLE_DISTANCE {
            workoutTitle.setText("Single Distance")
            setLabel.setText("Set Meters:")
            
            DistPickerGroup.setHidden(false)
            rowButton.setHidden(false)
        }
        
        // Intervals Time
        if NewWorkout?.type == PracticePlan.TIME_INTERVAL {
            workoutTitle.setText("Timed Intervals")
            setLabel.setText("Set Time:")
            
            TimePickerGroup.setHidden(false)
            setRestButton.setHidden(false)
        }
        
        // Intervals Distance
        if NewWorkout?.type == PracticePlan.DISTANCE_INTERVAL {
            workoutTitle.setText("Distance Intervals")
            setLabel.setText("Set Meters:")
            
            DistPickerGroup.setHidden(false)
            setRestButton.setHidden(false)
        }
    }
    
    // Configures and displays time for one interval or a single time
    // Based on selected values from picker
    func configureTime(){
        minutes = (MinutesHundDigit * 100) + (MinutesTensDigit * 10) + MinutesOnesDigit
        seconds = (SecondsTensDigit * 10) + SecondsOnesDigit
        totalTimeInSeconds = (minutes! * 60) + seconds!
        
        print(totalTimeInSeconds!)

        NewWorkout?.pieceTotalSeconds! = Double(totalTimeInSeconds!) as TimeInterval

    }

    
    // Configures and displays distance for one interval or single distance
    func configureDist(){
        totalDistanceInMeters = (DTenThousDigit * 10000) + (DOneThousDigit * 1000) + (DHundDigit * 100) + (DTensDigit * 10) + DOnesDigit
        
        NewWorkout!.pieceDistanceMeters = totalDistanceInMeters!
        let distometers:Int = NewWorkout!.pieceDistanceMeters!
        
        workSetLabel.setText(String(format: "%d", distometers))
    }
    
    
    
    // MARK: - Time Picker IBActions
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
    
    
    
    // MARK: - Meter Picker IBActions
    @IBAction func distTenThousChanged(_ value: Int) {
        DTenThousDigit = value
        configureDist()
    }
    
    @IBAction func distOneThousChanged(_ value: Int) {
        DOneThousDigit = value
        configureDist()
    }
    
    @IBAction func distHundChanged(_ value: Int) {
        DHundDigit = value
        configureDist()
    }
    
    @IBAction func distTensChanged(_ value: Int) {
        DTensDigit = value
        configureDist()
    }
    
    @IBAction func distOnesChanged(_ value: Int) {
        DOnesDigit = value
        configureDist()
    }
    
    
    @IBAction func setRestButtonPushed() {
        pushController(withName: "Set Rest", context: NewWorkout)
    }
    
    
    override func contextsForSegue(withIdentifier segueIdentifier: String) -> [Any]? {
        if segueIdentifier == "Config to WO"{
            return [NewWorkout!, NewWorkout!]
        }
        
        return nil
    }
    
   
}

