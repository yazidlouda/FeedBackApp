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
     private static var rowsCount = 5
     private var ratingStorage = [Double](repeating: 0, count: rowsCount)

    
    
    var Questions = ["Question1", "Question2", "Question3", "Question4", "Question5"]
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return Questions.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // call core data
        let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
        let rat = NSEntityDescription.insertNewObject(forEntityName: "User", into: context!) as! User
        
        let rating = ratingStorage[indexPath.row]
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! DataTableViewCell
        cell.update(rat.rating)
        
        cell.label.text = Questions[indexPath.row]
        cell.ratingBar.settings.fillMode = .precise
        cell.ratingBar.didFinishTouchingCosmos = { [weak self] rating in
            self?.ratingStorage[indexPath.row] = rating
            rat.rating = self?.ratingStorage.reduce(0, +) ?? 0
            
            
            //let dic = [rat.rating : self?.ratingStorage.reduce(0, +) ?? 0]
            DBHelper.inst.addRateData(rating: self?.ratingStorage.reduce(0, +) ?? 0)
            
            
           
                
                
           
              }
     
            return cell
    }
    
   
    @IBAction func getData(_ sender: Any) {
        
        let data = DBHelper.inst.getData()
        for st in data {
            print ("Average rate for room is",st.rating)
            
            if st.rating < 3{
                image.image = UIImage(named: "sad")
            }
            if st.rating > 3{
                image.image = UIImage(named: "smile")
            }
        
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<QuestionsViewController.rowsCount {
              ratingStorage[i] = Double(i) / 99 * 5
            }
        let data = DBHelper.inst.getData()
        for st in data {
            st.rating = 4
        }
    }
    
   
    

}
