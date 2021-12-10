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
    
    var tableViewData: [(sectionHeader: String, workouts: [Workout])]? {
        didSet {
            DispatchQueue.main.async {
                self.WorkoutTable.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let model = WorkoutModel()
        self.WorkoutTable.delegate = self
        self.WorkoutTable.dataSource = self
        self.workouts = model.getWorkouts()
        
        // Do any additional setup after loading the view.
    }
    
    func sortIntoSections(workouts: [Workout]) {
        
        // This function sorts the data into the workout type to better fit the table View
        var SingleDistSection  = [Workout]()
        var SingleTimeSection = [Workout]()
        var IntervalDistSection = [Workout]()
        var IntervalTimeSection = [Workout]()
        
        for typ in workouts {
            if typ.type == "Single Time" {
                SingleTimeSection.append(typ)
            }
            else if typ.type == "Single Distance" {
                SingleDistSection.append(typ)
            }
            else if typ.type == "Time Intervals"{
                IntervalTimeSection.append(typ)
            }
            else{ // for "Distance Intervals"
                IntervalDistSection.append(typ)
            }
        }
        
        var tmpData: [(sectionHeader: String, workouts: [Workout])] = []
        if SingleDistSection.count > 0 {
            tmpData.append((sectionHeader: "SINGLE DISTANCE", workouts: SingleDistSection))
        }
        if SingleTimeSection.count > 0 {
            tmpData.append((sectionHeader: "SINGLE TIME", workouts: SingleTimeSection))
        }
        if IntervalTimeSection.count > 0 {
            tmpData.append((sectionHeader: "INTERVAL TIME", workouts: IntervalTimeSection))
        }
        if IntervalDistSection.count > 0 {
            tmpData.append((sectionHeader: "INTERVAL DISTANCE", workouts: IntervalDistSection))
        }
        
        self.tableViewData = tmpData
    }
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in WorkoutTable: UITableView) -> Int {
        return self.tableViewData?.count ?? 0
    }
    
    // MARK: - AddWorkoutDelegate
    func save(recent: Workout) {
        self.workouts?.append(recent)
    }
    
    
    // MARK: - TableViewDelegate
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return self.tableViewData?[section].sectionHeader
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData?[section].workouts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = self.WorkoutTable.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! WorkoutMainTableViewCell
        
        guard let workoot = tableViewData?[indexPath.section].workouts[indexPath.row] else {
            return cell
        }
        
        cell.name?.text = workoot.type // i know its spelled wrong
        cell.subName?.text = workoot.location // i did it on purpose
        cell.coverImage?.image = UIImage(named: "Quad")
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView,
                   forSection section: Int)
    {
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = THEME_COLOR2
        header.contentView.backgroundColor = THEME_COLOR3
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let myWorkout = tableViewData?[indexPath.section].workouts[indexPath.row] else {
            return
        }
        print("Selected\(String(describing: myWorkout.type))")
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
