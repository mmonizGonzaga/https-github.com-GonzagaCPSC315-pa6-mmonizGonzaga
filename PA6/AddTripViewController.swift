//
//  Add Trip View Controller.swift
//  PA6
//
//  Created by Makayla Moniz on 10/28/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController {
    
    // add a property so the TripTableViewController can pass in a Trip
    // this is the Trip to show the editable details for
    var trip: Trip? = nil
    
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // if its SaveUnwindSegue, grab the values in the text fields and update the Trip.
        if let identifier = segue.identifier {
            if identifier == "SaveUnwindSegue" {
                if let destination = destinationTextField.text, let startDate = startDateTextField.text, let endDate = endDateTextField.text {
                    // what to do if one of the fields is empty??
                    let newTrip = Trip(destinationIn: destination, startIn: startDate, endIn: endDate)
                    self.trip = newTrip
                }
            }
        }
    }
    
    
}
