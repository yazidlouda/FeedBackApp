//
//  FoodTableViewCell.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var foodRatingBar: CosmosView!
    @IBOutlet weak var label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func update(_ rating: Double) {
        foodRatingBar.rating = rating
     }
}
