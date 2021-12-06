//
//  WOControlsController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/6/21.
//

import UIKit
import WatchKit

class WOControlsController: WKInterfaceController {

    @IBOutlet weak var restartButton: WKInterfaceButton!
    @IBOutlet weak var endButton: WKInterfaceButton!
    @IBOutlet weak var pauseButton: WKInterfaceButton!
    
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        restartButton.setBackgroundColor(BEST_BLUE)
        endButton.setBackgroundColor(SUPER_RED)
        pauseButton.setBackgroundColor(PERFECT_YELLOW)
        
    }
    
    @IBAction func endButtonPushed() {
        dismiss()
    }
    
    
}
