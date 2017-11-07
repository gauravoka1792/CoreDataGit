//
//  coreViewController.swift
//  CoreDataDemo
//
//  Created by Gaurav Oka on 11/1/17.
//  Copyright © 2017 Gaurav Oka. All rights reserved.
//

import UIKit
import CoreData

class coreViewController: UIViewController, classfbDelegate {
    
    
    
    func passData(info: [String : AnyObject]) {
        
//        let appDelegate = UIApplication.shared.delegate as! AppDelegate
//
//        let context = appDelegate.persistentContainer.viewContext
//
//        //Add User ####
//        //saving data to Core Data
//
//        let newUser = NSEntityDescription.insertNewObject(forEntityName: "Users", into: context)
//
//        if let name = info["name"] as? String
//        {
//            newUser.setValue(name, forKey:"name" )
//        }
//        if let first_name = info["first_name"] as? String
//        {
//            newUser.setValue(first_name, forKey: "first_name")
//        }
//        if let last_name = info["last_name"] as? String
//        {
//           newUser.setValue(last_name, forKey: "last_name")
//        }
//        if let email = info["email"] as? String
//        {
//           newUser.setValue(email, forKey: "email")
//        }
//         let picture = info["picture"] as? [String:Any]
//         let data = picture!["data"] as? [String:Any]
//
//        if let url = data!["url"] as? String
//        {
//           newUser.setValue(url, forKey: "picture")
//        }
//        if let id = info["id"] as? String
//        {
//          newUser.setValue(id, forKey: "id")
//        }
//
//        do
//        {
//            try context.save()
//            print("Saved")
//
//        }
//        catch
//        {
//            //error message
//        }
        
        
        
//This is NewBranch
        
        fetchData()
        
       // updateData()
        
        //deleteData()
        

    
    }
    
    
    func fetchData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let context = appDelegate.persistentContainer.viewContext
        
        //        // Pulling Data From Core Data
        //       //Fetch User ###
        let request = NSFetchRequest<NSFetchRequestResult>(entityName:"Users")
        request.returnsObjectsAsFaults = false
        
        do{
            let results = try context.fetch(request)
            
            if results.count > 0{
                for result in results as! [NSManagedObject]
                {
                    if let name = result.value(forKey: "name") as? String
                    {
                        print("Name is :",name)
                    }
                    if let first_name = result.value(forKey: "first_name") as? String
                    {
                        print("First Name is :",first_name)
                    }
                    if let last_name = result.value(forKey: "last_name") as? String
                    {
                        print("Last Name is :",last_name)
                    }
                    if let email = result.value(forKey: "email") as? String
                    {
                        print("Email is :",email)
                    }
                    if let picture = result.value(forKey: "picture") as? String
                    {
                        print("Picture Url is :",picture)
                    }
                    if let id = result.value(forKey: "id") as? String
                    {
                        print("Identity Number is :",id)
                    }
                    
                }
            }
        }
        catch{
            //Process
        }
        
    }
    
    func updateData()
    {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //update User ###
                let fetchrequestUpdate: NSFetchRequest<Users> = Users.fetchRequest()
        
                do
                {
                    let array_users = try context.fetch(fetchrequestUpdate)
                    let user  = array_users[2]
        
                    let name = "Shardul Rawle"
                    let email = "adibasu92@gmail.com"
                    let first_name = "Aditya"
                    let last_name = "Basarkar"
                    let picture = "HElLo"
                    let id = "1234"
        
                    user.setValue(name, forKey: "name")
                    user.setValue(first_name, forKey: "first_name")
                    user.setValue(last_name, forKey:"last_name")
                    user.setValue(email,forKey: "email")
                    user.setValue(picture, forKey: "picture")
                    user.setValue(id, forKey: "id")
        
                    do {
                        try context.save()
                        print("saved!")
                       }
                    catch let error as NSError  {
                        print("Could not save \(error), \(error.userInfo)")
                      }
                }
                catch
                {
                    print("Error With Request: \(error)")
                }
        }
    
    func deleteData()
    {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        //Delete User
        
        //        let fetchRequestDelete : NSFetchRequest<Users> = Users.fetchRequest()
        //
        //        do{
        //            let array_users = try context.fetch(fetchRequestDelete)
        //
        //           // let user = array_users[2]
        //
        //            for user in array_users as [NSManagedObject]
        //            {
        //                context.delete(user)
        //            }
        //
        //            do {
        //                try context.save()
        //                print("saved!")
        //            } catch let error as NSError  {
        //                print("Could not save \(error), \(error.userInfo)")
        //            } catch {
        //
        //            }
        //
        //        }
        //        catch{
        //            print("Error with request: \(error)")
        //        }
        
        //delete Option 2 ###
        
                let fetchRequestDelete : NSFetchRequest<Users> = Users.fetchRequest()
        
                do{
                    let array_users = try context.fetch(fetchRequestDelete)
                    let user  = array_users[2]
        
                    context.delete(user)
        
                    do {
                        try context.save()
                        print("saved!")
                    } catch let error as NSError  {
                        print("Could not save \(error), \(error.userInfo)")
                    } catch {
        
                    }
        
                  }
                catch
                {
                    print("Error with request: \(error)")
                }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       view.backgroundColor = UIColor .red
        //Storing CoreData
        
//        let viewcon = FbLoginViewController()
//        viewcon.delegate = self
//    

    }

   

}
