//
//  RowHistoryModel.swift
//  iRow WatchKit Extension
//
//  Created by Isabel L. Albaitis on 12/10/21.
//

import Foundation

class RowHistoryModel {
    
    fileprivate var recentRows: [OnWaterRow] = [OnWaterRow]()
    
    //TODO: CREATE TEST LIST
    
    func getRecentRows() -> [OnWaterRow]{
        return recentRows
    }
    
    fileprivate func addRow(rowWorkout: OnWaterRow){
        if recentRows.count > 9 {
            recentRows.remove(at: 9)
            recentRows.insert(rowWorkout, at: 0)
        }
        else{
            recentRows.insert(rowWorkout, at: 0)
        }
    }
    
}
