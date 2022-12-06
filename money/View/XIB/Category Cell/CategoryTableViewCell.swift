//
//  CategoryTableViewCell.swift
//  money
//
//  Created by User on 29.11.2022.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var categoryView: UIView!
    @IBOutlet weak var iconView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var categoryLabel: UILabel!
    
    var isChecked = 0
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        iconView.layer.cornerRadius = iconView.layer.bounds.height / 2
        iconView.clipsToBounds = true

        categoryView.backgroundColor = UIColor(named: "Color 1")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
    
}
