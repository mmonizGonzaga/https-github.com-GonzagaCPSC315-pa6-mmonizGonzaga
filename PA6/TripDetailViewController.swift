//
//  TripDetailViewController.swift
//  PA6
//
//  Created by Makayla Moniz on 10/25/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import UIKit

class TripDetailViewController: UIViewController {
    
    // add a property so the TripTableViewController can pass in a Trip
    var trip: Trip? = nil
    var numberOfTrips: Int? = nil
    var currentTripNumber: Int? = nil

    @IBOutlet var destination: UILabel!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var endDate: UILabel!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var tripNumber: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        displayTrip()
    }
    
    func displayTrip(){
        if let trip = trip {
            // TODO: update the view to show this dog's name and breed
            destination.text = trip.getDestinationName()
            startDate.text = trip.getStartDate()
            endDate.text = trip.getEndDate()
            if trip.imageFileName != nil{
                imageView.image = UIImage(named: trip.imageFileName!)
            }
            if let currNum = currentTripNumber, let totalNum = numberOfTrips{
                tripNumber.text = "Trip \(currNum) of \(totalNum)"
            }
        }
    }
    
}
