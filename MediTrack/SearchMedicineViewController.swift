//
//  SearchMedicineViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/7/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData

class SearchMedicineViewController: UIViewController,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var callButton: UIButton!
    
    var searchActive : Bool = false
    var filtered = [[String: AnyObject]]()
    var medicine=[String]()
    var medicineDtls = [[String:AnyObject]]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.searchBar.delegate = self
        
        self.navigationController?.isNavigationBarHidden = true
        searchBar.barTintColor = UIColor.orange
        callButton.backgroundColor = UIColor.orange

//        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action:#selector(SearchMedicineViewController.dismissKeyBoard))
//        view.addGestureRecognizer(tap)
    }
    
//    func dismissKeyBoard()
//    {
//        view.endEditing(true)
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func call(_ sender: Any) {
        
        if let url = URL(string: "tel://\("9971474399")"), UIApplication.shared.canOpenURL(url) {
            if #available(iOS 10, *) {
                UIApplication.shared.open(url)
            } else {
                UIApplication.shared.openURL(url)
            }
        }
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(searchActive) {
            return filtered.count
        }
            return medicineDtls.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "searchCell", for: indexPath) as! SearchMedicineTableViewCell
        
        
        if(searchActive && filtered.count > 0){
            cell.medicineNaame.text = filtered[indexPath.row]["medicineName"] as! String
        } else {
            cell.medicineNaame.text = medicineDtls[indexPath.row]["medicineName"] as? String
        }
        
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "UpdateMedicineViewController") as! UpdateMedicineViewController
        vcOBJ.title = "Edit Medicine"
        if searchActive && filtered.count > 0{
            vcOBJ.updateMedicine = filtered[indexPath.row]
        }else{
            vcOBJ.updateMedicine = medicineDtls[indexPath.row]
        }
        
        navigationController?.pushViewController(vcOBJ, animated: true)
        
        
        print("kashee ram")
        
    }
    
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true
    }
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false
    }
    
    
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered.removeAll()
        
        let firstNamePredicate = NSPredicate(format: " medicineName CONTAINS[cd] %@", searchText.uppercased())
        
        self.filtered = (medicineDtls as NSArray).filtered(using: firstNamePredicate) as! [[String : AnyObject]]
        if filtered.count == 0{
            searchActive = false
        }else{
            searchActive = true
        }
        
        self.tableView.reloadData()
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Medicine")
        request.returnsObjectsAsFaults = false
        self.navigationController?.isNavigationBarHidden = true
        
        
        do{
            let results = try context.fetch(request)
            var data=[String:AnyObject]()
            medicineDtls.removeAll()
            filtered.removeAll()
            
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
