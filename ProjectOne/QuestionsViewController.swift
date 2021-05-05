//
//  QuestionsViewController.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit
import CoreData
class QuestionsViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var image: UIImageView!
     
    static var totalRating = 0.0
    
    
    var Questions = ["Question1", "Question2", "Question3", "Question4", "Question5"]
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return Questions.count
      
    }
    //Size of Cell
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100.0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // call core data
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let rat = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        cell.update(rat.rating)
        
        cell.label.text = Questions[indexPath.row]
        cell.ratingBar.settings.fillMode = .half
        cell.ratingBar.didFinishTouchingCosmos = {  rating in

            QuestionsViewController.totalRating += Double(rating)

            DBHelper.inst.addRateData(rating: QuestionsViewController.totalRating ,userName:  ViewController.userId!)

            
           print(rating)
                
                
           
              }
     
            return cell
    }
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        for i in 0..<QuestionsViewController.rowsCount {
//              ratingStorage[i] = Double(i) / 99 * 5
//            }
//        let data = DBHelper.inst.getData()
//        for st in data {
//            st.rating = 4
//        }
    }
    
   
    

}
