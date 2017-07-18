//
//  MenuTableViewController.swift
//  MediTrack
//
//  Created by Rajeev Joshi on 15/07/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import GoogleSignIn

class MenuTableViewController: UITableViewController,GIDSignInDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        GIDSignIn.sharedInstance().delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
                    print("Sicessfully login into Firebase with google: ")
        
    }

    
    

    // MARK: - Table view data source
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1{
            
            
            let storyBoard = UIStoryboard(name:"Main",bundle:nil)
            let vcOBJ = self.storyboard?.instantiateViewController(withIdentifier: "NotificationViewController") as! NotificationViewController
            navigationController?.pushViewController(vcOBJ, animated: true)

        }
        if indexPath.row == 2{
            
            
            let storyBoard = UIStoryboard(name:"Main",bundle:nil)
            let vcOBJ = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
           
            navigationController?.present(vcOBJ, animated: true)
            GIDSignIn.sharedInstance().signOut()
            
        }
        
        
        
    }

}
