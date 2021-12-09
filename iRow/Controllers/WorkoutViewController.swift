//
//  WorkoutViewController.swift
//  iRow
//
//  Created by Jake Stone on 12/8/21.
//

import UIKit

class WorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var WorkoutTable: UITableView!
    
    var workouts: [Workout]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.WorkoutTable.delegate = self
        self.WorkoutTable.dataSource = self
        let model = WorkoutModel()
        self.workouts = model.getWorkouts()

        // Do any additional setup after loading the view.
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in WorkoutTable: UITableView) -> Int {
        return 1
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension Date {
    struct Formatter {
        static let short: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "MM-dd-yyyy"
            return formatter
        }()
    }
    
    var short: String {
        return Formatter.short.string(from: self)
    }
}

extension String {
    var dateFromShort: Date? {
        return Date.Formatter.short.date(from: self)
    }
}
