//
//  TripTableViewCell.swift
//  PA6
//
//  Created by Makayla Moniz on 10/25/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import UIKit

class TripTableViewCell: UITableViewCell {
    
    // add outlets to our labels in our TripCell
    
    @IBOutlet var destinationLabel: UILabel!
    @IBOutlet var startDateLabel: UILabel!
    @IBOutlet var endDateLabel: UILabel!
    @IBOutlet var tripImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func update(with trip: Trip) {
        // initialize the labels to show the trip information
        destinationLabel.text = trip.getDestinationName()
        startDateLabel.text = trip.getStartDate()
        endDateLabel.text = trip.getEndDate()
        
        // just going to hard code every table view cell's image view to show the same trip
        if let imageName = trip.imageFileName{
            tripImageView.image = UIImage(named: imageName)
        }
    }
    
}
