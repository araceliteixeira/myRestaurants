//
//  ViewController.swift
//  myRestaurants
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Araceli Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {


    //MARK: Properties
    @IBOutlet weak var lblRestName: UILabel!
    @IBOutlet weak var txtRestName: UITextField!
    @IBOutlet weak var imgRestaurant: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtRestName.delegate = self
    }
    
    //MARK: Text Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //Hide the keyboard
        txtRestName.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        lblRestName.text = txtRestName.text
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
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        lblRestName.text = "Default Name"
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        //Hide the keyboard
        txtRestName.resignFirstResponder()
        
        //Creating the image picker controller
        let imagePickerController = UIImagePickerController()
        
        //Defining the source of the images: the photo library
        imagePickerController.sourceType = .photoLibrary
        
        //Notify the ViewController when the user picks an images
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }

}

