//
//  WOControlsController.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/6/21.
//

import UIKit
import WatchKit
import WatchConnectivity

class WOControlsController: WKInterfaceController, WCSessionDelegate {
    
    func session(_ session: WCSession, activationDidCompleteWith activationState: WCSessionActivationState, error: Error?) {
        
    }
    

    @IBOutlet weak var restartButton: WKInterfaceButton!
    @IBOutlet weak var endButton: WKInterfaceButton!
    
    let session = WCSession.default
    
    var workout : PracticePlan?
    var SentWOData: [String:Any?] = ["Type": nil,
                                     "Work Seconds": nil,
                                     "Distance": nil,
                                     "Rest Seconds": nil]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        workout = context as! PracticePlan?
        
        session.delegate = self
        session.activate()
        
        endButton.setBackgroundColor(SUPER_RED)
        restartButton.setBackgroundColor(PERFECT_YELLOW)
        
    }
    
    @IBAction func resetButtonPushed() {
        dismiss()
    }
    
    @IBAction func endButtonPushed() {
        SentWOData = ["Type": workout!.type,
                      "Work Seconds": workout!.pieceTotalSeconds,
                      "Distance": workout!.pieceDistanceMeters,
                      "Rest Seconds": workout!.restTotalSeconds]
        
        session.sendMessage(SentWOData as [String : Any], replyHandler: nil, errorHandler: { (error) in print("Error sending message: %@", error)
        })
        print (String(describing: workout))
        dismiss()
    }
    
    
}
