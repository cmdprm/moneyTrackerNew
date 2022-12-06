//
//  OperationTableViewCell.swift
//  money
//
//  Created by User on 28.11.2022.
//

import UIKit

class OperationTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = 10
        backView.backgroundColor = UIColor(named: "Color 1")
        
        iconView.layer.cornerRadius = iconView.layer.bounds.height / 2
        iconView.clipsToBounds = true
        
        categoryLabel.textColor = UIColor(named: "Color 2")
        dateLabel.textColor = UIColor(named: "Color 2")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
