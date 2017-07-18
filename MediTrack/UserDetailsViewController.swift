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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
