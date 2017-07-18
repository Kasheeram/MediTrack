//
//  NotificationViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/13/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit

class NotificationViewController: UIViewController {
    @IBOutlet weak var alertTextField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var button: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target:self,action:#selector(AddMedicineViewController.dismissKeyBoard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyBoard()
    {
        view.endEditing(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancelNotification(_ sender: Any) {
        
        let notificationArray = UIApplication.shared.scheduledLocalNotifications!
        
        for notification in notificationArray {
            
            if notification.fireDate == fixedNotificationDate(datePicker.date) {
                
                UIApplication.shared.cancelLocalNotification(notification)
                
            }
            
        }

    }
    
    @IBAction func cancelAllNotification(_ sender: Any) {
        
        UIApplication.shared.cancelAllLocalNotifications()
    }
    
    @IBAction func printAllNotification(_ sender: Any) {
        
        let notifications = UIApplication.shared.scheduledLocalNotifications!
        
        print(notifications)
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        let notification = UILocalNotification()
        notification.fireDate = fixedNotificationDate(datePicker.date)
            print(notification.fireDate)
        
        if alertTextField.text == "" {
            
            notification.alertBody = "New blog is posted at blog.apoorvmote.com"
            
        }
        else {
            
            notification.alertBody = alertTextField.text
            
        }
        
        
        notification.timeZone = TimeZone.current
        
        notification.repeatInterval = NSCalendar.Unit.minute
        
        notification.applicationIconBadgeNumber = 1
        notification.soundName = UILocalNotificationDefaultSoundName
        
        UIApplication.shared.scheduleLocalNotification(notification)
        
        
        
        
        
    }
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        //navigationController?.popViewController(animated: true)
        
        //dismiss(animated: true, completion: nil)
        
        
    }
    

    
    func fixedNotificationDate(_ dateToFix: Date) -> Date {
        
        var dateComponents: DateComponents = (Calendar.current as NSCalendar).components([NSCalendar.Unit.day, NSCalendar.Unit.month, NSCalendar.Unit.year, NSCalendar.Unit.hour, NSCalendar.Unit.minute], from: dateToFix)
        
        dateComponents.second = 0
        
        let fixedDate: Date = Calendar.current.date(from: dateComponents)!
        
        return fixedDate
        
    }
    
    
    func updateUI() {
        
        let currentSettings = UIApplication.shared.currentUserNotificationSettings
        
        if currentSettings?.types != nil {
            
            if currentSettings!.types == [UIUserNotificationType.alert, UIUserNotificationType.badge] {
                
                datePicker.isHidden = false
                
                button.isHidden = false
                
                alertTextField.isHidden = false
                
            }
            else if currentSettings!.types == UIUserNotificationType.badge {
                
                alertTextField.isHidden = true
                
            }
            else if currentSettings!.types == UIUserNotificationType() {
                
                datePicker.isHidden = true
                
                button.isHidden = true
                
                alertTextField.isHidden = true
                
            }
            
        }
        
    }

}
