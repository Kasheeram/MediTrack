//
//  UserDetailsViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/7/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData

class UserDetailsViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var age: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
                let newUser = NSEntityDescription.insertNewObject(forEntityName: "UserDetails", into: context)
               newUser.setValue(userName.text, forKey: "username")
               newUser.setValue(age.text, forKey: "age")
        
                do{
                    try context.save()
                    print("SAVED")
               }catch{
        
                }
        
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
}
