//
//  ViewController.swift
//  myRestaurants
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Araceli Teixeira. All rights reserved.
//

import UIKit
import os.log

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextViewDelegate {

    //MARK: Properties
    @IBOutlet weak var txtRestName: UITextField!
    @IBOutlet weak var imgRestaurant: UIImageView!
    @IBOutlet weak var txtAddress: UITextField!
    @IBOutlet weak var txtComment: UITextView!
    
    @IBOutlet weak var rateLocation: RatingControl!
    @IBOutlet weak var rateService: RatingControl!
    @IBOutlet weak var rateCleaning: RatingControl!
    @IBOutlet weak var rateTotal: RatingControl!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var restaurant: Restaurant?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtRestName.delegate = self
        txtAddress.delegate = self
        txtComment.delegate = self
        
        //Setting the text view's border
        self.txtComment.layer.borderColor = UIColor(red: 0.8, green: 0.8, blue: 0.8, alpha: 1).cgColor
        self.txtComment.layer.borderWidth = 0.5
        self.txtComment.layer.cornerRadius = 5
        
        //Set up views if editing an existing Meal
        if let existRestaurant = restaurant {
            navigationItem.title = existRestaurant.name
            txtRestName.text = existRestaurant.name
            imgRestaurant.image = existRestaurant.image
            txtAddress.text = existRestaurant.address
            txtComment.text = existRestaurant.comment
            rateLocation.rating = existRestaurant.rateLocation
            rateService.rating = existRestaurant.rateAttendance
            rateCleaning.rating = existRestaurant.rateCleaning
            rateTotal.rating = existRestaurant.rateTotal
        }
        
        updateSaveButtonState()
    }
    
    //MARK: Text Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        updateSaveButtonState()
        navigationItem.title = textField.text!
    }
    
    //Dismiss the text view keyboard, when the user types "Done"
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" //Recognizes enter key in keyboard
        {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //Disable the Save button while editing
        if textField == txtRestName {
            saveButton.isEnabled = false
        }
    }
    
    //MARK: Private Methods
    
    private func updateSaveButtonState() {
        //Disable the Save button if the textfield is empty
        if let text = txtRestName.text {
            saveButton.isEnabled = !text.isEmpty
        }
    }
    
    //MARK: Image View Delegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        //Dismiss the picker if the user canceled
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //Takes the original image
        if let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            //Set photoImageView to display the selected image
            imgRestaurant.image = selectedImage
            
            //Dismiss the picker
            dismiss(animated: true, completion: nil)
        } else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
    }
    
    //MARK: Actions
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        txtRestName.resignFirstResponder()
        txtAddress.resignFirstResponder()
        txtComment.resignFirstResponder()
        
        //Creating the image picker controller
        let imagePickerController = UIImagePickerController()
        
        //Defining the source of the images: the photo library
        imagePickerController.sourceType = .photoLibrary
        
        //Notify the ViewController when the user picks an images
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

    @IBAction func cancelButton(_ sender: UIBarButtonItem) {
        //Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways
        let isPresentingInAddRestaurantMode = presentingViewController is UINavigationController
	
        if isPresentingInAddRestaurantMode {
            dismiss(animated: true, completion: nil)
        }
        // if its not a modal presentation, we must test if it is a push presentation
        else if let owningNavigationController = navigationController {
            owningNavigationController.popViewController(animated: true)
        }
        else {
           fatalError("The MealViewController is not inside a navigation controller.")
        }
    }
    
    //MARK: Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        //Configure the destination view controller only when the save button is pressed
        if let button = sender as? UIBarButtonItem {
            if button === saveButton {
                //retrieving the screen data
                let name = txtRestName.text
                let image = imgRestaurant.image
                let address = txtAddress.text
                let comment = txtComment.text
                let location = rateLocation.rating
                let service = rateService.rating
                let cleaning = rateCleaning.rating
                let total = rateTotal.rating
                
                //testing if the restaurant's name and ratings are not nil
                if !(name?.isEmpty)! {
                    restaurant = Restaurant(name: name!, image: image, address: address, comment: comment, location: location, attendance: service, cleaning: cleaning, total: total, breakfast: nil, lunch: nil, dinner: nil)
                } else {
                    //print the message on debug log
                    os_log("Restaurant do not have a name", log: OSLog.default, type: .debug)
                }
            }
            
        } else {
            switch segue.identifier! {
            case "goToBreakfast":
                print(">>>>>>>>>>>>>>>>>>> Breakfast")
            case "goToLunch":
                print(">>>>>>>>>>>>>>>>>>> Lunch")
            case "goToDinner":
                print(">>>>>>>>>>>>>>>>>>> Dinner")
            default:
                print("Unknown")
            }
        }
    }
    
    @IBAction func backToRestaurant(unwindSegue: UIStoryboardSegue) {
        print(">>>>>>>>>>>>>>>>>>> I'm back!")
    }
}

