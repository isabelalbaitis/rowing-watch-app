//
//  WODisplayController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis and Jacob Stone on 11/2/21.
//

import UIKit
import WatchKit
import CoreMotion
import CoreLocation

class WODisplayController: WKInterfaceController {
   
    @IBOutlet weak var splitDisplay: WKInterfaceTimer!
    @IBOutlet weak var timerDisplay: WKInterfaceTimer!
    @IBOutlet weak var intervalCounter: WKInterfaceLabel!
    @IBOutlet weak var totalMeters: WKInterfaceLabel!
    @IBOutlet weak var strokeRate: WKInterfaceLabel!
    
    var meters = 0
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        configureSplit()
        startRow()
        intervalCounter.setText("1")
    }
    
    func configureSplit(){
        let d: Date = Date(timeIntervalSinceNow: 121)
        splitDisplay.setDate(d)
    }
    
    func startRow(){
        if CMSensorRecorder.isAccelerometerRecordingAvailable() {
            let motion = CMMotionManager()
            
            motion.accelerometerUpdateInterval = 1.0 / 60.0
            motion.startAccelerometerUpdates()
            
            if (motion.accelerometerData?.acceleration.y)! > 0{
                timerDisplay.start()
                totalMeters.setText("\(meters)")
                
            }
            
            
        }
    }
    
    func trackDistanceCovered(location1: CLLocation, location2: CLLocation){
        meters += Int(location1.distance(from: location2))
    }
    
    func configureStrokeRate(){
        strokeRate.setText("30")
    }

    
}
