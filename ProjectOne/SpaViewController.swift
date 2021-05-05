//
//  SpaViewController.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit
import CoreData

class SpaViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
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
       
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell3", for: indexPath) as! SpaTableViewCell
        cell.label.text = Questions[indexPath.row]
        cell.update(rat.spaRating)
        
        cell.label.text = Questions[indexPath.row]
        cell.spaRatingBar.settings.fillMode = .precise
        cell.spaRatingBar.didFinishTouchingCosmos = {  rating in
           
            
            SpaViewController.totalRating += Double(rating)
            DBHelper.inst.addSpaRateData(rating: SpaViewController.totalRating ,userName:  ViewController.userId!)
           
              }
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
