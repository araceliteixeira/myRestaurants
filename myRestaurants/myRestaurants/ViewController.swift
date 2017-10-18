//
//  ViewController.swift
//  myRestaurants
//
//  Created by MacStudent on 2017-10-18.
//  Copyright © 2017 Araceli Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {


    //MARK: Properties
    @IBOutlet weak var lblRestName: UILabel!
    @IBOutlet weak var txtRestName: UITextField!

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

    //MARK: Actions
    
    @IBAction func setDefaultLabelText(_ sender: UIButton) {
        lblRestName.text = "Default Name"
    }
}

