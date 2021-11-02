//
//  InterfaceController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel Albaitis on 10/29/21.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet weak var JustRowButton: WKInterfaceButton!
    @IBOutlet weak var SetWorkoutButton: WKInterfaceButton!
    @IBOutlet weak var HistoryButton: WKInterfaceButton!
    @IBOutlet weak var RerowButton: WKInterfaceButton!
    
    
    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }
    
    
    
    

}
