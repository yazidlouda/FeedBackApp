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
        

         }
    
    
    func update(_ rating: Double) {
       ratingBar.rating = rating
     }

    
 
}
