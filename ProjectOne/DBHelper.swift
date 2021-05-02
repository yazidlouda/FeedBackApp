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
    static var rowsCount = 5
    var ratingStorage = [Double](repeating: 0, count: rowsCount)
    
    
    
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
    func addRateData (rating : Double)
    {
        // 1
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User

         // 2
         user.rating = rating/5
         

         // 3
        
        
        do{
            try context?.save()
            print("data saved")
            print(user.rating)
        }
        catch{
            print("data not saved")
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
    
   
}
