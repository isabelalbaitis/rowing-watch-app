//
//  WorkoutViewController.swift
//  iRow
//
//  Created by Jake Stone on 12/8/21.
//

import UIKit
import Foundation
import WatchConnectivity

var formatter = DateComponentsFormatter()

@available(iOS 15.0, *)
class WorkoutViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet weak var WorkoutTable: UITableView!
    static let SINGLE_TIME: Int = 0
    static let SINGLE_DISTANCE: Int = 1
    static let TIME_INTERVAL: Int = 2
    static let DISTANCE_INTERVAL: Int = 3
    
    var workouts: [Workout]?
    var command: Command!
    
    // Outstanding transfers can change in the background so make a copy (cache) to
    // make sure the data doesn't change during the table view loading cycle.
    // Subclasses can override the computed property to provide the right transfers.
    //
    var transfersStore: [SessionTransfer]?
    var transfers: [SessionTransfer] {

        guard transfersStore == nil else { return transfersStore! }
        
        if command == .transferUserInfo {
            transfersStore = WCSession.default.outstandingUserInfoTransfers.filter {
                $0.isCurrentComplicationInfo == false
            }
            
        } else if command == .transferCurrentComplicationUserInfo {
            transfersStore = WCSession.default.outstandingUserInfoTransfers.filter {
                $0.isCurrentComplicationInfo == true
            }
        }
        return transfersStore!
    }
    
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
        self.workouts = model.getWorkouts()
        self.sortIntoSections(workouts: self.workouts!)
        
        // Do any additional setup after loading the view.
        NotificationCenter.default.addObserver(
            self, selector: #selector(type(of: self).dataDidFlow(_:)),
            name: .dataDidFlow, object: nil
        )
    deinit {
            NotificationCenter.default.removeObserver(self)
        }
        
    }
    
    func sortIntoSections(workouts: [Workout]) {
        
        // This function sorts the data into the workout type to better fit the table View
        var SingleDistSection  = [Workout]()
        var SingleTimeSection = [Workout]()
        var IntervalDistSection = [Workout]()
        var IntervalTimeSection = [Workout]()
        
        for typ in workouts {
            if typ.type == 0 {
                SingleTimeSection.append(typ)
            }
            else if typ.type == 1 {
                SingleDistSection.append(typ)
            }
            else if typ.type == 2{
                IntervalTimeSection.append(typ)
            }
            else{ // for "Distance Intervals" a.k.a 3
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
    
    // MARK: - AddWorkoutDelegate
    //func save(recent: Workout) {
    //    self.workouts?.append(recent)
    //}
    
    // MARK: - UITableViewDataSource
    func numberOfSections(in WorkoutTable: UITableView) -> Int {
        return self.tableViewData?.count ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.tableViewData?[section].workouts.count ?? 0
    }
    
    @available(iOS 15.0, *)
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)
        -> UITableViewCell
    {
        let cell = self.WorkoutTable.dequeueReusableCell(withIdentifier: "ImageCell", for: indexPath) as! WorkoutMainTableViewCell
        
        guard let workoot = tableViewData?[indexPath.section].workouts[indexPath.row] else {
            return cell
        }
        
        cell.Date?.text = workoot.date?.formatted(date: Date.FormatStyle.DateStyle.long, time: Date.FormatStyle.TimeStyle.omitted)
        cell.coverImage?.image = UIImage(named: "Quad")
        
        if(workoot.type == 0){// single time
            cell.Measure?.text = formatter.string(from: (workoot.totalTime ?? 0)!) // prints in MM:SS format
            cell.Units?.text = "Minutes"
        }
        
        else if(workoot.type == 1){ // Single Distance
            cell.Measure?.text = String(workoot.meters!)
            cell.Units?.text = "Meters"
        }
        
        else if(workoot.type == 2){ // interval Time
            let timeString = formatter.string(from: (workoot.totalTime)!)
            let restString = formatter.string(from: (workoot.rest)!)
            cell.Measure?.text = timeString! + " minutes"
            cell.Units?.text = restString! + " minutes"
        }
        
        else{ // interval Distance
            let restyString = formatter.string(from: (workoot.rest)!)
            cell.Measure?.text = String(workoot.meters!) + " meters"
            cell.Units?.text = restyString! + " minutes"
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 200.0
    }
   
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?
    {
        return self.tableViewData?[section].sectionHeader
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

