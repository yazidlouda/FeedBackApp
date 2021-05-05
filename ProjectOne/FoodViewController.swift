//
//  FoodViewController.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit
import CoreData
class FoodViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    static var totalRating = 0.0
    var Questions = ["Question1", "Question2", "Question3", "Question4", "Question5"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return Questions.count
      
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let rat = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! FoodTableViewCell
        cell.update(rat.foodRating)
        
        cell.label.text = Questions[indexPath.row]
        
        cell.foodRatingBar.settings.fillMode = .precise
        cell.foodRatingBar.didFinishTouchingCosmos = {  rating in
            FoodViewController.totalRating += Double(rating)

            DBHelper.inst.addFoodRateData(rating: FoodViewController.totalRating ,userName:  ViewController.userId!)
            
        }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

   

}
