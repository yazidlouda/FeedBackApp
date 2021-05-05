//
//  DBHelper.swift
//  ProjectOne
//
//  Created by Home on 4/24/21.
//

import Foundation
import CoreData
import UIKit

class DBHelper{
    static var inst = DBHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    static var checkData = false
    
    
    func addData (object : [String:String])
    {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        user.firstName = object["firsName"]
        user.lastName = object["lastName"]
        user.email = object["email"]
        user.password = object["password"]
        user.confirmPassword = object["confirmPassword"]
        
        do{
            try context?.save()
            print("data saved")
        }
        catch{
            print("data not saved")
        }
    }
    func updateData(object : [String:String])
    {
        
        var st = User()
        if (st.email != nil) {
            var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
            fetchReq.predicate = NSPredicate(format : "name ==%@", st.email as! CVarArg)
            do{
                let stu = try context?.fetch(fetchReq)
                if (stu?.count != 0){
                    st = stu?.first as! User
                    st.password = object["password"]
                    st.confirmPassword = object["confirmPassword"]
                    print("data saved")
                }
               
            }catch
            {
                print("data not updated")
            }
        }else{
            print("no data")
        }
       
        
    }
    func addRateData (rating : Double, userName : String)
    {
       
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format : "email ==%@", userName)
        do{
            let stu = try context?.fetch(fetchReq)
            if (stu?.count != 0){
                st = stu?.first as! User
                st.rating = rating/5
                print("data saved")
            }
           
        }catch
        {
            print("data not updated")
        }
        

    }
    func addFoodRateData (rating : Double, userName : String)
    {
        // 1
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format : "email ==%@", userName)
        do{
            let stu = try context?.fetch(fetchReq)
            if (stu?.count != 0){
                st = stu?.first as! User
                st.foodRating = rating/5
                print("data saved")
            }
           
        }catch
        {
            print("data not updated")
        
    }
    }
        func addSpaRateData (rating : Double, userName : String)
    {
        // 1
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format : "email ==%@", userName)
        do{
            let stu = try context?.fetch(fetchReq)
            if (stu?.count != 0){
                st = stu?.first as! User
                st.spaRating = rating/5
                print("data saved")
            }
           
        }catch
        {
            print("data not updated")
    }
        }
            func addGymRateData (rating : Double, userName : String)
    {
                var st = User()
                var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
                fetchReq.predicate = NSPredicate(format : "email ==%@", userName)
                do{
                    let stu = try context?.fetch(fetchReq)
                    if (stu?.count != 0){
                        st = stu?.first as! User
                        st.gymRating = rating/5
                        print("data saved")
                    }
                   
                }catch
                {
                    print("data not updated")
    }
            }
                func addOverallRateData (rating : Double, userName : String)
    {
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName: "User")
        fetchReq.predicate = NSPredicate(format : "email ==%@", userName)
        do{
            let stu = try context?.fetch(fetchReq)
            if (stu?.count != 0){
                st = stu?.first as! User
                st.overallRating = rating/5
                print("data saved")
            }
           
        }catch
        {
            print("data not updated")
    }
                }
    func getData() -> [User]
    {
        var stu = [User]()
        var fetchReq = NSFetchRequest<NSFetchRequestResult>(entityName: "User")
        do{
            stu = try context?.fetch(fetchReq)as! [User]
        }
        catch{
            print("can not fetch any data")
        }
        return stu
    }
                
    func getOneData (email : String)-> User
    {
        var st = User()
        var fetchReq = NSFetchRequest<NSManagedObject>.init(entityName : "User")
        fetchReq.predicate = NSPredicate(format: "email == %@", email)
        fetchReq.fetchLimit = 1
        do {
            let req = try context?.fetch(fetchReq) as! [User]
            if (req.count != 0){
                st = req.first as! User
                DBHelper.checkData = true
            }
            else {
                print("data not found")
                DBHelper.checkData = false
                
            }
        }catch{
            print("")
        }
        return st
    }
}

