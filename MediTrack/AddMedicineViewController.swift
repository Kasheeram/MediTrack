//
//  AddMedicineViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/7/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData

class AddMedicineViewController: UIViewController {
    
    @IBOutlet weak var medicineName: UITextField!
    @IBOutlet weak var doseFrequency: UITextField!
    @IBOutlet weak var quantityAtaTime: UITextField!
    @IBOutlet weak var numberofDose: UITextField!
    @IBOutlet weak var timeOne: UITextField!
    @IBOutlet weak var timeTwo: UITextField!
    @IBOutlet weak var numberofTimePurchased: UITextField!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        let newMedicine = NSEntityDescription.insertNewObject(forEntityName: "Medicine", into: context)
                newMedicine.setValue(medicineName.text, forKey: "medicineName")
                newMedicine.setValue(quantityAtaTime.text, forKey: "doseAmount")
                newMedicine.setValue(doseFrequency.text, forKey: "doseFrequency")
        
        newMedicine.setValue(numberofDose.text, forKey: "numberofDose")
        newMedicine.setValue(timeOne.text, forKey: "timeOne")
        newMedicine.setValue(timeTwo.text, forKey: "timeTwo")
         newMedicine.setValue(numberofTimePurchased.text, forKey: "numberofTimePurchased")
        
                do{
                    try context.save()
                    print("SAVED")
                }catch{
                    
                }
        
    }
    
    
}
