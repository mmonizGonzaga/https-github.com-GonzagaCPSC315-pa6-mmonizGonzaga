//
//  Add Trip View Controller.swift
//  PA6
//
//  Created by Makayla Moniz on 10/28/18.
//  Copyright © 2018 Makayla Moniz. All rights reserved.
//

import UIKit

class AddTripViewController: UIViewController, UITextFieldDelegate {
    
    // add a property so the TripTableViewController can pass in a Trip
    // this is the Trip to show the editable details for
    var trip: Trip? = nil
    var newTripNum: Int? = nil
    
    @IBOutlet var destinationTextField: UITextField!
    @IBOutlet var startDateTextField: UITextField!
    @IBOutlet var endDateTextField: UITextField!
    @IBOutlet var addTripLable: UILabel!
    
    
    @IBOutlet var addOutlet: UIButton!
    @IBAction func addAction(_ sender: Any) {
        let dateFormatter = DateFormatter()
        let dateFormat: String = "MM/DD/YYYY"
        dateFormatter.dateFormat = dateFormat
        
        if destinationTextField.text == nil || destinationTextField.text == ""{
            invalidInputAlert(messageIn: "Please enter a destination")
        }
        else if(startDateTextField.text == nil || startDateTextField.text == ""){
            invalidInputAlert(messageIn: "Start date is missing")
        }
        else if(endDateTextField.text == nil || endDateTextField.text == ""){
            invalidInputAlert(messageIn: "End date is missing")
        }
        else if startDateTextField.text != nil && startDateTextField.text != ""{
            if dateFormatter.date(from: startDateTextField.text!) != nil{
                if endDateTextField.text != nil && endDateTextField.text != ""{
                    if dateFormatter.date(from: endDateTextField.text!) != nil{
                        let newTrip = Trip(destinationIn: destinationTextField.text!, startIn: startDateTextField.text!, endIn: endDateTextField.text!)
                        self.trip = newTrip
                        performSegue(withIdentifier: "SaveUnwindSegue", sender: self)
                    }
                    else{
                        invalidInputAlert(messageIn: "End date is not valid, please enter in MM/DD/YYYY format")
                    }
                }
            }
            else{
                invalidInputAlert(messageIn: "Start date is not valid, please enter in MM/DD/YYYY format")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.destinationTextField.delegate = self
        self.startDateTextField.delegate = self
        self.endDateTextField.delegate = self
        
        if let newTripNum = newTripNum{
            addTripLable.text = "Add trip #\(newTripNum)"
        }
        print(newTripNum)
        //site source, this is so we can click outside the decimal keyboard https://medium.com/@KaushElsewhere/how-to dismiss-keyboard-in-a-view-controller-of-ios-3b1bfe973ad1
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self.view, action: Selector("endEditing:")))
    }
    
    
    func invalidInputAlert(messageIn: String){
        var alertController = UIAlertController(title: "Invalid Input", message: messageIn, preferredStyle: .alert)
        // add an action to the actionsheet/alert
        // we will add one for "Okay"
        alertController.addAction(UIAlertAction(title: "Try Again", style: .default, handler: { (action) -> Void in
            print("User just pressed okay")
        }))
        // we will talk about handlers and closures next week :)
        // present the actionsheet/alert via the present() function
        present(alertController, animated: true, completion: { () -> Void in
            print("Just finished showing the alert dialog to the user")
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
