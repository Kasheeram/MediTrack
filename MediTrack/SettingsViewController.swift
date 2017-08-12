//
//  SettingsViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/6/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet weak var profileView: UIView!
    @IBOutlet weak var medicineView: UIView!
    @IBOutlet weak var settingsView: UIView!
    
    @IBOutlet weak var navigation: UINavigationItem!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
       
       navigationController?.navigationBar.barTintColor = UIColor.orange
        
        let border = CALayer()
        let width = CGFloat(1.0)
        border.frame = CGRect.init(x: 0, y: profileView.frame.size.height-width, width: profileView.frame.size.width, height: width)
        border.backgroundColor = UIColor.gray.cgColor
        self.profileView.layer.addSublayer(border)
        
        let border1 = CALayer()
      //  let width = CGFloat(1.0)
        border1.frame = CGRect.init(x: 0, y: settingsView.frame.size.height-width, width: settingsView.frame.size.width, height: width)
        border1.backgroundColor = UIColor.gray.cgColor
        self.settingsView.layer.addSublayer(border1)
        
        let border2 = CALayer()
       // let width = CGFloat(1.0)
        border2.frame = CGRect.init(x: 0, y: medicineView.frame.size.height-width, width: medicineView.frame.size.width, height: width)
        border2.backgroundColor = UIColor.gray.cgColor
        self.medicineView.layer.addSublayer(border2)
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
    
    
    
    @IBAction func userDetailsButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "UserDetailsViewController") as! UserDetailsViewController
        vcOBJ.title = "Add User Details"
        navigationController?.pushViewController(vcOBJ, animated: true)
        
    }
    
    @IBAction func addMedicineButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "AddMedicineViewController") as! AddMedicineViewController
        vcOBJ.title = "Add Medicine"
        navigationController?.pushViewController(vcOBJ, animated: true)
    }
    
    @IBAction func settingButtonTapped(_ sender: Any) {
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "SOSSettingsUpdateViewController") as! SOSSettingsUpdateViewController
        vcOBJ.title = "Add Contact"
        navigationController?.pushViewController(vcOBJ, animated: true)
    }
    
    
    @IBAction func callButtonTapped(_ sender: Any) {
        
        
    }
    
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
}
