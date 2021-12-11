//
//  iRowRepo.swift
//  iRow
//
//  Created by Jake Stone on 12/10/21.
//

import Foundation
import Firebase
import UIKit
import FirebaseFirestore


class iRowRepository {
    fileprivate static let instance =  iRowRepository()
    fileprivate var ref: CollectionReference?
    fileprivate var db: Firestore!
    fileprivate var listener: ListenerRegistration?

    var userId: String?
    
    static func getInstance() -> iRowRepository
    {
        return instance
    }
    
    init() {
        self.db = Firestore.firestore()
    }

    // MARK: Authentication Operations
    func signIn(email: String, password: String, onCompletion: @escaping  (Bool,String?) -> (Void)) {
        Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
            if let _ = user {
                onCompletion(true,nil)
            } else {
                onCompletion(false,error?.localizedDescription ?? "Unknown error.  Please try again later.")
            }
        }
    }
    
    func signUp(email: String, password: String, onCompletion: @escaping  (Bool,String?) -> (Void))
    {
        Auth.auth().createUser(withEmail: email, password: password ) { (user, error) in
            if let _ = user {
                onCompletion(true,nil)
            } else {
                onCompletion(false,error?.localizedDescription ?? "Unknown error.  Please try again later.")
            }
        }
    }
    
    func logout()
    {
        do {
            try Auth.auth().signOut()
            print("Logged out")
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
    
    // MARK: Listener Operations
    func listenForAuthenticationChanges(onChange: @escaping  (String?) -> (Void)) {
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user {
                self.userId = user.uid
                self.ref = self.db.collection("user").document(user.uid)
                onChange(self.userId)
            } else {
                // No user is signed in.
                onChange( nil)
            }
        }
        
    }
    
    func listenForNewWorkouts(onChange: @escaping ([Workout]) -> Void) {
        self.listener = self.ref?.collection("workouts").addSnapshotListener({ (snapshot, error) in
            guard let documents = snapshot?.documents else {
                print("Error fetching documents: \(error!)")
                return
            }
            var workouts = [Workout]()
            for doc in documents {
                let key = doc.documentID
                let type : String? = doc["Type"] as! String?
                let location : String?  = doc["Location"] as! String?
                let date  = doc["Date"] as! String?
                let tod = doc["Time of Day"] as! String?
                let meters = doc["Meters"] as! Double?
                let split = doc["Split"] as! Double?
                let totalTime = doc["Total Time"] as! String?

                let workout = Workout(key: key, type: type, location: location,
                        date: date?.dateFromISO8601, tod: tod, meters: meters, split: split, totalTime: totalTime)
                workouts.append(workout)
            }
            onChange(workouts)
        })
    }
    
    func stopListeningForUpdates() {
        if let l = self.listener {
            l.remove()
        }
    }
    
    // MARK: Workout
    func saveMyWorkout(workout: Workout) {
        if let r = self.ref {
            if let k = workout.key {
                let child : DocumentReference? = r.collection("workouts").document(k)
                child?.setData(self.toDictionary(vals: workout))
            } else {
                r.collection("workouts").addDocument(data: self.toDictionary(vals: workout))
            }
        }
    }
    
    fileprivate func toDictionary(vals: Workout) -> [String:Any] {
        return [
            "Type": vals.name! as NSString,
            "Location": vals.location! as NSString,
            "Date" : NSString(string: (vals.startDate?.iso8601)!) ,
            "Time of Day": NSString(string: (vals.endDate?.iso8601)!),
            "Meters" : NSNumber(value: vals.lat!),
            "Split" : NSNumber(value: vals.lng!),
            "Total Time" : vals.placeId! as NSString
        ]
    }
}

