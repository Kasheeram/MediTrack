//
//  MedicineDetailsViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/6/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData

class MedicineDetailsViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    

    @IBOutlet weak var menuButton: UIBarButtonItem!
    @IBOutlet weak var tableView: UITableView!
    
    var medicine=[String]()
    var medicineDtls = [[String:AnyObject]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideMenu()
        tableView.dataSource = self
        tableView.delegate = self
        navigationController?.navigationBar.barTintColor = UIColor.orange
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func sideMenu(){
        if revealViewController() != nil{
            menuButton.target = revealViewController()
            menuButton.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = 275
            revealViewController().rightViewRevealWidth = 160
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
    
    
    @IBAction func callForEmengency(_ sender: Any) {
        
        if let url = URL(string: "tel://\("9971474399")"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }

    }
    
    
    @IBAction func setRemainder(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
        navigationController?.pushViewController(vcOBJ, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return medicineDtls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "MedicineCell", for: indexPath) as! MedicineDetailsTableViewCell
        cell.medicineName.text = medicineDtls[indexPath.row]["medicineName"] as? String
        cell.doseAmount.text = medicineDtls[indexPath.row]["doseAmount"] as? String
        cell.numberofTimes.text = medicineDtls[indexPath.row]["numberofTimes"] as? String
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Medicine")
        request.returnsObjectsAsFaults = false
        medicineDtls.removeAll()
        
        do{
            let results = try context.fetch(request)
            var data=[String:AnyObject]()
            if results.count > 0{
                for result in results as! [NSManagedObject]{
                    if let medicineName = result.value(forKey: "medicineName") as? String{
                        print(medicineName)
                        data["medicineName"]=medicineName as AnyObject
                    }
                    if let doseAmount = result.value(forKey: "doseAmount") as? String{
                        print(doseAmount)
                        data["doseAmount"] = doseAmount as AnyObject
                    }
                    if let numberofTimes = result.value(forKey: "numberofDose") as? String{
                        print(numberofTimes)
                        data["numberofTimes"] = numberofTimes as AnyObject
                    }
                    medicineDtls.append(data)
                    tableView.reloadData()
                }
            }
        }catch{
            
        }
        
    }
}
