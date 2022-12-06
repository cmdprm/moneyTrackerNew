//
//  AccountTableViewCell.swift
//  money
//
//  Created by User on 26.11.2022.
//

import UIKit

class AccountTableViewCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var crownImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.layer.cornerRadius = backView.frame.height / 8
        
        backView.layer.shadowColor = UIColor.gray.cgColor
        backView.layer.shadowOpacity = 0.2
        backView.layer.shadowRadius = 5
        
        backView.backgroundColor = UIColor(named: "Color 1")
        
        crownImage.isHidden = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
