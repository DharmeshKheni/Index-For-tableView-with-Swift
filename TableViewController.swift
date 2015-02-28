//
//  TableViewController.swift
//  testing
//
//  Created by Anil on 28/02/15.
//  Copyright (c) 2015 Variya Soft Solutions. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var animals : [String : [String]] =
    ["B" : ["Bear", "Black Swan", "Buffalo"],
        "C" : ["Camel", "Cockatoo"],
        "D" : ["Dog", "Donkey"],
        "E" : ["Emu"],
        "G" : ["Giraffe", "Greater Rhea"],
        "H" : ["Hippopotamus", "Horse"],
        "K" : ["Koala"],
        "L" : ["Lion", "Llama"],
        "M" : ["Manatus", "Meerkat"],
        "P" : ["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],
        "R" : ["Rhinoceros"],
        "S" : ["Seagull"],
        "T" : ["Tasmania Devil"],
        "W" : ["Whale", "Whale Shark", "Wombat"]]
    
    var animalSection = [String]()
    var rev = [String]()
    
    var animalIndexTitles : NSArray = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    override func viewDidLoad() {
        super.viewDidLoad()

        animalSection = animals.keys.array
        rev = sorted(animalSection, { (s1, s2) -> Bool in
            return s1 <= s2
        })
        println(rev)
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return animalSection.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        var sectionTitle = rev[section]   // String
        var sectionAnimals : [String] = animals[sectionTitle]! // String Array
        return sectionAnimals.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        // Configure the cell...
        let cell :AnyObject = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        var sectionTitle = rev[indexPath.section]
        var sectionAnimals : [String] = animals[sectionTitle]!
        var animal = sectionAnimals[indexPath.row]
        cell.textLabel??.text = animal
        return cell as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return rev[section]
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [AnyObject]! {
        return animalIndexTitles
    }
    
    override func tableView(tableView: UITableView,sectionForSectionIndexTitle title: String, atIndex index: Int) -> Int {
        
        return animalIndexTitles.indexOfObject(title)
        
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
