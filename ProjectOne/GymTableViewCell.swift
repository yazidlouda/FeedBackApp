//
//  GymTableViewCell.swift
//  ProjectOne
//
//  Created by Home on 4/26/21.
//

import UIKit

class GymTableViewCell: UITableViewCell {

    @IBOutlet weak var gymRatingBar: CosmosView!
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
        gymRatingBar.rating = rating
     }
}
