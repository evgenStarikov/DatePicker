//
//  ViewController.swift
//  DatePicker
//
//  Created by Starikov Evgen on 08.12.15.
//  Copyright © 2015 Starikov Evgen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let datePicker: UIDatePicker = UIDatePicker()
    let datePickerContainer = UIView()
    var child = true
    
    // commit #1

    @IBOutlet weak var selectedDate: UILabel!

    
    @IBAction func pickerOpenNew(sender: AnyObject) {
        
        datePickerContainer.frame = CGRectMake(0.0, self.view.frame.height/2, 320.0, 300.0)
        datePickerContainer.backgroundColor = UIColor.whiteColor()
        
        let pickerSize : CGSize = datePicker.sizeThatFits(CGSizeZero)
        datePicker.frame = CGRectMake(0.0, 20, pickerSize.width, 160)
        //datePicker.setDate(NSDate(), animated: true) // Date now
        datePicker.maximumDate = NSDate()
        
        if child {
            let now = NSDate()
            let nowCalendar = NSCalendar.currentCalendar()
            let dateNowCalendar = NSCalendar.currentCalendar()
            let nowComponents = nowCalendar.components([.Day, .Month, .Year], fromDate: now)
            nowComponents.year = nowComponents.year - 18
            let newDate = dateNowCalendar.dateFromComponents(nowComponents)
            print(newDate)
            datePicker.minimumDate = newDate
        }

        datePicker.datePickerMode = UIDatePickerMode.Date
        datePicker.addTarget(self, action: "dateChangedInDate:", forControlEvents: UIControlEvents.ValueChanged)
        datePickerContainer.addSubview(datePicker)
        
        let doneButton = UIButton()
        doneButton.setTitle("Done", forState: UIControlState.Normal)
        doneButton.setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        doneButton.addTarget(self, action: Selector("dismissPicker:"), forControlEvents: UIControlEvents.TouchUpInside)
        doneButton.frame    = CGRectMake(250.0, 5.0, 70.0, 37.0)
        
        datePickerContainer.addSubview(doneButton)
        
        self.view.addSubview(datePickerContainer)
    
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }
    
    func dateChangedInDate(sender:UIDatePicker){
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
//        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
//        dateFormatter.timeStyle = NSDateFormatterStyle.NoStyle
        let strDate = dateFormatter.stringFromDate(datePicker.date)
        self.selectedDate.text = strDate
        
    }
    
    func dismissPicker(sender: UIButton) {
        
        datePickerContainer.removeFromSuperview()
    }
 

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

