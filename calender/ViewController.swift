//
//  ViewController.swift
//  calender
//
//  Created by Ellis on 10/12/15.
//  Copyright (c) 2015 Ellis. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {
    
    
    var name: [String] = []
//    var des: [String] = []
    var t_time: [String] = []
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1 //section numbers
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    // Creating, returning cell for a particular row
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! UITableViewCell
        
        // Contents
        cell.textLabel?.text = t_time[indexPath.row]
        // description
        cell.detailTextLabel?.text = name[indexPath.row]
        //Retrieve an image
        var myImage = UIImage(named: "apple")
        cell.imageView?.image = myImage
        return cell
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Today"
    }
    
    // Slide to delete a cell
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            // handle delete (by removing the data from your array and updating the tableview)
            name.removeAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        }
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "v3") {
            let vc1:ViewController_3 = segue.destinationViewController as! ViewController_3
            vc1.t_name = name
//            vc1.t_des = des
            vc1.time = t_time
        }
    }
    
    
}

