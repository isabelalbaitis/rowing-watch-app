//
//  RowHistoryModel.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/10/21.
//

import Foundation

class RowHistoryModel {
    
    fileprivate var recentRows: [PracticePlan] = [PracticePlan]()
    
    init()  { createList() }
    
    func getRecentPlans() -> [PracticePlan] { return recentRows }
    
    
    // Dummy data for demo
    fileprivate func createList(){
        recentRows.append(PracticePlan.init(type: 0, pieceSeconds: 34565, pieceMeters: 35434, restSeconds: 60))
        recentRows.append(PracticePlan.init(type: 1, pieceSeconds: 6765, pieceMeters: 656, restSeconds: 35469))
        recentRows.append(PracticePlan.init(type: 2, pieceSeconds: 55343, pieceMeters: 2000, restSeconds: 34434))
        recentRows.append(PracticePlan.init(type: 3, pieceSeconds: 8000, pieceMeters: 10000, restSeconds: 420))
    }
    
}
