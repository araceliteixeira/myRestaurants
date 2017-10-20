//
//  Meal.swift
//  myRestaurants
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 Araceli Teixeira. All rights reserved.
//

import UIKit

class Meal {
    
    //MARK: Properties
    
    public private(set) var name: String
    public private(set) var image: UIImage!
    public private(set) var comment: String!
    public private(set) var ratePresentation: Int
    public private(set) var rateFlavor: Int
    public private(set) var ratePrice: Int
    public private(set) var rateTotal: Int
    
    init(name: String, image: UIImage!, comment: String!, presentation: Int, flavor: Int, price: Int, total: Int) {
        self.name = name
        self.image = image
        self.comment = comment
        ratePresentation = presentation
        rateFlavor = flavor
        ratePrice = price
        rateTotal = total
    }
    
    public func setName(_ name: String) {
        if name.isEmpty {
            self.name = ""
        } else {
            self.name = name
        }
    }
    
    public func setImage(_ image: UIImage!) {
        self.image = image
    }
    
    public func setComment(_ comment: String!) {
        self.comment = comment
    }
    
    public func setRatePresentation(_ presentation: Int) {
        if presentation >= 0 && presentation <= 5 {
            self.ratePresentation = presentation
        } else if presentation > 5 {
            self.ratePresentation = 5
        } else {
            self.ratePresentation = 0
        }
    }
    
    public func setRateFlavor(_ flavor: Int) {
        if flavor >= 0 && flavor <= 5 {
            self.rateFlavor = flavor
        } else if flavor > 5 {
            self.rateFlavor = 5
        } else {
            self.rateFlavor = 0
        }
    }
    
    public func setRatePrice(_ flavor: Int) {
        if flavor >= 0 && flavor <= 5 {
            self.ratePrice = flavor
        } else if flavor > 5 {
            self.ratePrice = 5
        } else {
            self.ratePrice = 0
        }
    }
    
    public func setRateTotal(_ total: Int) {
        if total >= 0 && total <= 5 {
            self.rateTotal = total
        } else if total > 5 {
            self.rateTotal = 5
        } else {
            self.rateTotal = 0
        }
    }
}
