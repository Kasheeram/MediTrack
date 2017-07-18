//
//  LoginViewController.swift
//  MediTrack
//
//  Created by Apogee on 7/6/17.
//  Copyright © 2017 Apogee. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import GoogleSignIn

class LoginViewController: UIViewController,GIDSignInUIDelegate,GIDSignInDelegate  {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//        newUser.setValue("Mohan", forKey: "username")
//        newUser.setValue("Mohan123", forKey: "password")
//        
//        do{
//            try context.save()
//            print("SAVED")
//        }catch{
//            
//        }
        
//        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Users")
//        request.returnsObjectsAsFaults = false
//        
//        do{
//            let results = try context.fetch(request)
//            
//            if results.count > 0{
//                for result in results as! [NSManagedObject]{
//                    if let username = result.value(forKey: "username") as? String{
//                        print(username)
//                        
//                    }
//                    if let password = result.value(forKey: "password") as? String{
//                        print(password)
//                        
//                    }
//                }
//            }
//        }catch{
//            
//        }
        
        // add Google SignIn Button
        
        
        let googleButton = GIDSignInButton()
        googleButton.frame = CGRect(x:20,y:270,width:view.frame.width-40,height:50)
        view.addSubview(googleButton)
        GIDSignIn.sharedInstance().uiDelegate = self
        GIDSignIn.sharedInstance().delegate = self
        
        navigationController?.navigationBar.barTintColor = UIColor.orange
        
     
        
    }
    
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error!) {
        if let err = error{
            print("Fail to login ",err)
            return
        }
        
        print("Sucessfully login",user)
        
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "MedicineDetailsViewController") as! MedicineDetailsViewController
        navigationController?.pushViewController(vcOBJ, animated: true)
        
        
        
        guard let idToken = user.authentication.idToken else{ return }
        guard let accessToken = user.authentication.accessToken else{return}
        let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                       accessToken: accessToken)
        
        Auth.auth().signIn(with: credential) { (user, error) in
            if let error = error {
                
                print("Fail to create a Firebase user with Google accoutn: ",error)
                return
            }
            guard let uid = user?.uid else { return }
            print("Sicessfully login into Firebase with google: ",uid)
        }
        
        let storyBoard1 = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ1 = storyBoard1.instantiateViewController(withIdentifier: "SWRevealViewController")
        //        navigationController?.pushViewController(vcOBJ, animated: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vcOBJ1
        
    }

    
    
     override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func loginButtonTapped(_ sender: Any) {
        
        let storyBoard = UIStoryboard(name:"Main",bundle:nil)
        let vcOBJ = storyBoard.instantiateViewController(withIdentifier: "SWRevealViewController")
//        navigationController?.pushViewController(vcOBJ, animated: true)
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.window?.rootViewController = vcOBJ
        
    }

    
    override func viewWillAppear(_ animated: Bool) {
        let navBar: UINavigationBar = UINavigationBar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 60))
        self.view.addSubview(navBar);
        let navItem = UINavigationItem(title: "Login Screen");
        navBar.barTintColor = UIColor.orange
        navBar.setItems([navItem], animated: false);
    }
    
    
    
}
