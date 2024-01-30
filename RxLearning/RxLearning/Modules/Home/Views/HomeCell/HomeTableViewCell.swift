//
//  HomeTableViewCell.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 29/1/24.
//

import UIKit

class HomeTableViewCell: UITableViewCell {
    @IBOutlet weak var DescriptionLabel: UILabel!
    @IBOutlet weak var NameLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
