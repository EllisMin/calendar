//
//  ViewController_3.swift
//  calender
//
//  Created by Ellis on 10/14/15.
//  Copyright (c) 2015 Ellis. All rights reserved.
//

import UIKit

class ViewController_3: UIViewController, UITextFieldDelegate {
    
    var t_name: [String] = [] //temp var for name
//    var t_des: [String] = [] // temp var for description
    var time: [String] = []
    
    var saveVal = false
    var backBtn = false
    @IBOutlet weak var eventName: UITextField!
//    @IBOutlet weak var Description: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        eventName.becomeFirstResponder()
        // Do any additional setup after loading the view.
//        self.Description.delegate = self
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // return to move screen
    func textFieldShouldReturn(userText: UITextField) -> Bool {
        userText.resignFirstResponder()
        return true;
    }
    
    
    
    @IBAction func done(sender: AnyObject) {
        saveVal = true
    }
    
    // Time part
    @IBOutlet weak var timePicker: UIDatePicker!
    var timeFormatter = NSDateFormatter()
    var strDate = ""
    
    @IBAction func timePickerChanged(sender: AnyObject) {
        setTime()
    }
    func setTime(){
        timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
        strDate = timeFormatter.stringFromDate(timePicker.date)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "v1" || segue.identifier == "v1_2") {
            let vc3:ViewController = segue.destinationViewController as! ViewController
            timeFormatter.timeStyle = NSDateFormatterStyle.ShortStyle
            strDate = timeFormatter.stringFromDate(timePicker.date)
            
            // Only when user presses Done button
            if saveVal{ // Add only if the user hit the done button
                t_name.append(eventName.text)
//                t_des.append(Description.text)
                time.append(strDate)
            }
            vc3.name = t_name // pass values to other view controller
//            vc3.des = t_des
            vc3.t_time = time
        }
    }
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
