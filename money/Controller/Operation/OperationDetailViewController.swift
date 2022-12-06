//
//  OperationDetailViewController.swift
//  money
//
//  Created by User on 28.11.2022.
//

import UIKit

class OperationDetailViewController: UIViewController {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var imageView: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    
    @IBOutlet weak var dataView: UIView!
    
    @IBOutlet weak var shopNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var accountLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var selSectionOfOpertaion: Int = 0
    var indexOfOperation: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        backView.layer.cornerRadius = 15
        backView.backgroundColor = UIColor(named: "Color 1")
        
        imageView.layer.cornerRadius = imageView.layer.bounds.height / 2
        imageView.clipsToBounds = true
        
        dataView.layer.cornerRadius = 15
        dataView.backgroundColor = UIColor(named: "Color 1")
        
        let operation = operations[selSectionOfOpertaion][indexOfOperation]
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        dateFormatter.timeStyle = .none
        
        iconImage.image = UIImage(systemName: operation.category.icon)
        imageView.backgroundColor = operation.category.color
        
        shopNameLabel.text = operation.title
        categoryLabel.text = operation.category.name
        
        if operation.status == 0 {
            amountLabel.text = "-\(operation.amount)\(currency)"
            amountLabel.textColor = UIColor(red: 0.85, green: 0.26, blue: 0.08, alpha: 1.00)
        } else {
            amountLabel.text = "+\(operation.amount)\(currency)"
            amountLabel.textColor = UIColor(red: 0.18, green: 0.49, blue: 0.20, alpha: 1.00)
        }
        
        accountLabel.text = operation.account
        dateLabel.text = dateFormatter.string(from: operation.date)
    }

}
