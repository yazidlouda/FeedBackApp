//
//  OverallViewController.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit
import CoreData

class OverallViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
   
    static var totalRating = 0.0
    var Questions = ["How friendly were the resort staff members?", "How do you rate the music?", "how do you rate the night animations?", "How likely is it that you would come back?", "How likely are you to recommend our resort to others?"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
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
        
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell4", for: indexPath) as! OverallTableViewCell
        cell.label.text = Questions[indexPath.row]
        cell.update(rat.overallRating)
        
        cell.label.text = Questions[indexPath.row]
        cell.overallRatingBar.settings.fillMode = .precise
        cell.overallRatingBar.didFinishTouchingCosmos = {  rating in
            OverallViewController.totalRating += Double(rating)
            DBHelper.inst.addOverallRateData(rating: OverallViewController.totalRating ,userName:  ViewController.userId!)
           
                
                
           
              }
        cell.layer.backgroundColor = UIColor.clear.cgColor
        tableView.layer.backgroundColor = UIColor.clear.cgColor
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

 

}

