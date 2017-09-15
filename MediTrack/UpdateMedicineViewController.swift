//
//  UpdateMedicineViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/11/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData

class UpdateMedicineViewController: UIViewController {
    
    @IBOutlet weak var medicineName: UITextField!
    @IBOutlet weak var doseFrequency: UITextField!
    @IBOutlet weak var quantity: UITextField!
    
    var person = [NSManagedObject]()
    var updateMedicine:[String:AnyObject]!

    override func viewDidLoad() {
        super.viewDidLoad()

        medicineName.text = updateMedicine["medicineName"] as? String
        doseFrequency.text = updateMedicine["doseAmount"] as? String
        quantity.text = updateMedicine["numberofTimes"] as? String
        self.navigationController?.isNavigationBarHidden = false
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
    

    @IBAction func updateButtonTapped(_ sender: Any) {
        var editName = medicineName.text!
        var editDose = doseFrequency.text!
        var editQuantity = quantity.text!
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Medicine")
        
        do{
            let results = try context.fetch(request)
            if results.count > 0 {
                for result in results as! [NSManagedObject]{
                    if let medicinename = result.value(forKey: "medicineName") as? String{
                        if medicinename == updateMedicine["medicineName"] as? String{
                            result.setValue(editName, forKey: "medicineName")
                        }
                    }
                    if let doseamount = result.value(forKey: "doseAmount") as? String{
                        if doseamount == updateMedicine["doseAmount"] as? String{
                            result.setValue(editDose, forKey: "doseAmount")
                        }
                    }
                    if let numberoftime = result.value(forKey: "numberofDose") as? String{
                        if numberoftime == updateMedicine["numberofTimes"] as? String{
                            result.setValue(editQuantity, forKey: "numberofDose")
                        }
                    }
                    do{
                        try context.save()
                        print("Medicine Details Updated")
                        
                    }catch{
                        
                    }
                }
            }
        }catch{
            
        }
        navigationController?.popViewController(animated: true)
    }
}
