//
//  RestaurantTableViewController.swift
//  myRestaurants
//
//  Created by MacStudent on 2017-10-20.
//  Copyright © 2017 Araceli Teixeira. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {

    //MARK: Properties
    var data: [Restaurant] = []
    
    //MARK: Private methods
    //Add restaurants to data array
    private func loadData() {
        let imgKFC = UIImage(named: "KFC")
        let imgMc = UIImage(named: "McDonalds")
        let imgTim = UIImage(named: "Tim Hortons")
        
        let tim = Restaurant(name: "Tim Hortons", image: imgTim, address: nil, comment: nil, location: 4, attendance: 4, cleaning: 5, total: 4, breakfast: nil, lunch: nil, dinner: nil)
        let mc = Restaurant(name: "McDonalds", image: imgMc, address: nil, comment: nil, location: 5, attendance: 3, cleaning: 4, total: 4, breakfast: nil, lunch: nil, dinner: nil)
        let kfc = Restaurant(name: "KFC", image: imgKFC, address: nil, comment: nil, location: 3, attendance: 5, cleaning: 5, total: 5, breakfast: nil, lunch: nil, dinner: nil)
        
        data.append(tim)
        data.append(mc)
        data.append(kfc)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        //Load the sample data
        loadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "RestaurantTableViewCell", for: indexPath) as? RestaurantTableViewCell {
            
            //Fetches the appropriate restaurant for the data source layout
            let restaurant = data[indexPath.row]
            
            //Configure the cell...
            cell.lblName.text = restaurant.name
            cell.restaurantImage?.image = restaurant.image
            cell.rateTotal.rating = restaurant.rateTotal
            
            return cell
        } else {
            fatalError("The dequeued cell is not an instance of RestaurantTableViewCell")
        }
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
