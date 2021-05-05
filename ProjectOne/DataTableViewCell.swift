//
//  DataTableViewCell.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit
import CoreData

class DataTableViewCell: UITableViewCell {
    
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    @IBOutlet weak var ratingBar: CosmosView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let data = DBHelper.inst.getData()
        for st in data {
            st.rating = ratingBar.rating
            
    }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
//        ratingBar.settings.fillMode = .precise
//         ratingBar.didFinishTouchingCosmos = {
//            rate in print(rate)
//
//
            
               
            
                
          //  }
         }
    
    
    func update(_ rating: Double) {
       ratingBar.rating = rating
     }
//    func addData (object : [String:Double] )
//    {
//        ratingBar.settings.fillMode = .precise
//        ratingBar.didFinishTouchingCosmos = {
//            rate in
//            let rat = NSEntityDescription.insertNewObject(forEntityName: "User", into: self.context!) as! User
//            rat.rating = object[1]
//
//        }
//
//
//        do{
//            try context?.save()
//            print("data saved")
//        }
//        catch{
//            print("data not saved")
//        }
//    }
}
