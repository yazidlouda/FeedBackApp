//
//  SummaryViewController.swift
//  ProjectOne
//
//  Created by Home on 5/3/21.
//

import UIKit

class SummaryViewController: UIViewController {

    
    
    @IBOutlet weak var roomRating: CosmosView!
    @IBOutlet weak var foodRating: CosmosView!
    @IBOutlet weak var spaRating: CosmosView!
    @IBOutlet weak var gymRating: CosmosView!
    @IBOutlet weak var overallRating: CosmosView!
    
    @IBOutlet weak var img: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = DBHelper.inst.getOneData(email: ViewController.userId!)
      //  for st in data {
        if(DBHelper.checkData ){
            roomRating.rating = data.rating
            foodRating.rating = data.foodRating
            spaRating.rating = data.spaRating
            gymRating.rating = data.gymRating
            overallRating.rating = data.overallRating
            print(roomRating.rating)
            
            
            var avrageRating = roomRating.rating + foodRating.rating + spaRating.rating + gymRating.rating + overallRating.rating
            if(avrageRating/5 < 3 ){
                self.img.image = UIImage(named: "sad")
                
            }else {
                self.img.image = UIImage(named: "smile")
            }
           
        }
            
      
    }
    

   

}
