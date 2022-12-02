//
//  ColorCollectionViewCell.swift
//  money
//
//  Created by User on 01.12.2022.
//

import UIKit

class ColorCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var colorView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        colorView.layer.borderColor = UIColor(red: 0.46, green: 0.46, blue: 0.46, alpha: 1.00).cgColor
        colorView.layer.borderWidth = 0
        
        colorView.layer.cornerRadius = colorView.layer.bounds.width / 2
        colorView.clipsToBounds = true
    }
    
    
    
}
