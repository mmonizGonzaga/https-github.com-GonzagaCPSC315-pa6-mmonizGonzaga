//
//  ViewController.swift
//  PA6
//
//  Created by Makayla Moniz on 10/25/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import UIKit

class TripTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    var trips = [Trip]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        initializeTrips()
    }
    
    func initializeTrips() {
        trips.append(Trip(destinationIn: "Fiji", startIn: "01/26/19", endIn: "02/13/19", imageNameIn: "Fuiji.jpg"))
        trips.append(Trip(destinationIn: "Australia", startIn: "04/26/19", endIn: "05/13/19", imageNameIn: "Fuiji.jpg"))
        trips.append(Trip(destinationIn: "Portugal", startIn: "08/26/19", endIn: "09/13/19", imageNameIn: "Fuiji.jpg"))
        trips.append(Trip(destinationIn: "New Zealand", startIn: "09/26/19", endIn: "10/13/19", imageNameIn: "Fuiji.jpg"))
        trips.append(Trip(destinationIn: "Alaska", startIn: "11/26/19", endIn: "12/13/19", imageNameIn: "Fuiji.jpg"))
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return trips.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCell(withIdentifier: "TripCell", for: indexPath) as! TripTableViewCell
        // dequeReusableCell() returns a generic UITableViewCell
        // we want to downcast it to our UITableViewCell subclass so we can get that specific behavior we wrote in TripTableViewCell
        // update the cell's views to show information for the trip at indexPath.row in dogs array
        // IndexPath has two properites section and row
        // since we only have one section, we only need to use its row
        let trip = trips[indexPath.row]
        cell.update(with: trip)
        cell.showsReorderControl = true
        
        // return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let trip = trips.remove(at: sourceIndexPath.row)
        trips.insert(trip, at: destinationIndexPath.row)
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            trips.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            if identifier == "DetailSegue" {
                // need a reference to the TripDetailViewController that is about to be shown
                if let tripDetailVC = segue.destination as? TripDetailViewController {
                    
                    // get the trip that was selected
                    if let indexPath = tableView.indexPathForSelectedRow {
                        let trip = trips[indexPath.row]
                        tripDetailVC.trip = trip
                    }
                }
            }
            else if identifier == "AddSegue" {
                print("Adding a new trip")
            }
        }
    }
    
    // an unwind method
    @IBAction func unwindToTripTableVC(segue: UIStoryboardSegue) {
        print("unwinding")
        // get the trip if there is one from addTripViewController
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let addTripVC = segue.source as? AddTripViewController {
                    if let trip = addTripVC.trip {
                    
                            // unwinding from an AddSegue because there is not a selected row
                            // get the dog, add it to the array
                            // update the table view
                        trips.append(trip)
                        tableView.reloadData()
                    }
                }
            }
        }
    }
    
    
    @IBAction func editBarButtonPressed(_ sender: UIBarButtonItem) {
        let newEditing = !tableView.isEditing
        tableView.setEditing(newEditing, animated: true)
        
    }
    
}

