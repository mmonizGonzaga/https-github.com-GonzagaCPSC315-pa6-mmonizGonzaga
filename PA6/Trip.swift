//
//  Trip.swift
//  Represents a trip with detination, start and end date, and a optional image
//  PA6
//
//  Created by Makayla Moniz on 10/25/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import Foundation

class Trip: CustomStringConvertible{

    
    var destinationName: String
    var startDate: Date
    var endDate: Date
    var imageFileName: String?
    let dateFormatter: DateFormatter
    let dateFormat: String = "MM/dd/yyyy"
    
    var description: String{
        return " Trip to \(destinationName) from \(startDate) to \(endDate)"
    }
    
    // Default initializer
    init(){
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        destinationName = "Maui"
        startDate = dateFormatter.date(from: "02/13/1998")!
        endDate = dateFormatter.date(from: "02/23/1998")!
        imageFileName = "No File"
    }
    
    // memberwise initializer for trip with an imagae
    init(destinationIn: String, startIn: String, endIn: String, imageNameIn: String){
        destinationName = destinationIn
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        startDate = dateFormatter.date(from: startIn)!
        endDate = dateFormatter.date(from:endIn)!
        imageFileName = imageNameIn
    }
    
     // memberwise initializer for trip without an imagae
    init(destinationIn: String, startIn: String, endIn: String){
        destinationName = destinationIn
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        startDate = dateFormatter.date(from: startIn)!
        endDate = dateFormatter.date(from:endIn)!
    }
    
    /**
     Gets the Destination name of the trip and returns the destination name
     
     - Returns: destination name
     */
    func getDestinationName()-> String{
        return destinationName
    }
    
    /**
     Gets the Start date of the trip and returns start date
     
     - Returns: start date as a string
     */
    func getStartDate() -> String{
        return dateFormatter.string(from: startDate)
    }
    
    /**
     Gets the end date of the trip and returns end date
     
     - Returns: end date as a string
    */
    func getEndDate() -> String{
        return dateFormatter.string(from: endDate)
    }
    
    
    
}
