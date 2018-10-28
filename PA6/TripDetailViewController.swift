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

    @IBOutlet var destination: UILabel!
    @IBOutlet var startDate: UILabel!
    @IBOutlet var endDate: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let trip = trip {
            // TODO: update the view to show this dog's name and breed
            destination.text = trip.getDestinationName()
            startDate.text = trip.getStartDate()
            endDate.text = trip.getEndDate()
            if let imageName = trip.imageFileName{
                imageView.image = UIImage(named: trip.imageFileName!)
            }
        }
        
    }
    
}
