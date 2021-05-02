//
//  FoodViewController.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit

class FoodViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var Questions = ["Question1", "Question2", "Question3", "Question4", "Question5"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
            return Questions.count
      
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! FoodTableViewCell
        cell.label.text = Questions[indexPath.row]
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
