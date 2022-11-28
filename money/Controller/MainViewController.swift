//
//  ViewController.swift
//  money
//
//  Created by User on 25.11.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    /// Account Properties
    @IBOutlet weak var accountView: UIView!
    @IBOutlet weak var accountButton: UIButton!
    
    @IBOutlet weak var accountNameLabel: UILabel!
    @IBOutlet weak var accountAmountLabel: UILabel!
    
    /// Operation Properties
    @IBOutlet weak var lastOperationView: UIView!
    @IBOutlet weak var lastOperationButton: UIButton!
    
    @IBOutlet weak var operationLabel: UILabel!
    
    /// Income Properties
    @IBOutlet weak var incomeView: UIView!
    @IBOutlet weak var incomeButton: UIButton!
    
    /// Waste Properties
    @IBOutlet weak var wasteView: UIView!
    @IBOutlet weak var wasteButton: UIButton!
    
    /// Settings Properties
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var settingsButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// Account Setup
        accountView.layer.cornerRadius = accountView.frame.height / 8
        
        accountView.layer.shadowColor = UIColor.gray.cgColor
        accountView.layer.shadowOpacity = 0.2
        accountView.layer.shadowRadius = 5
        
        accountButton.layer.cornerRadius = accountButton.frame.height / 8
        accountButton.setTitle("", for: .normal)
        
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)$"
        
        /// Operation Setup
        lastOperationView.layer.cornerRadius = lastOperationView.frame.height / 8
        
        lastOperationView.layer.shadowColor = UIColor.gray.cgColor
        lastOperationView.layer.shadowOpacity = 0.2
        lastOperationView.layer.shadowRadius = 5
        
        lastOperationButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        lastOperationButton.setTitle("", for: .normal)
        
        let lastOperation = operations[0]
        
        operationLabel.text = "\(lastOperation.title): \(lastOperation.amount)$"
        
        /// Income Setup
        incomeView.layer.cornerRadius = incomeView.frame.height / 8
        
        incomeView.layer.shadowColor = UIColor.gray.cgColor
        incomeView.layer.shadowOpacity = 0.2
        incomeView.layer.shadowRadius = 5
        
        incomeButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        incomeButton.setTitle("", for: .normal)
        
        /// Waste Setup
        wasteView.layer.cornerRadius = incomeView.frame.height / 8
        
        wasteView.layer.shadowColor = UIColor.gray.cgColor
        wasteView.layer.shadowOpacity = 0.2
        wasteView.layer.shadowRadius = 5
        
        wasteButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        wasteButton.setTitle("", for: .normal)
        
        /// Settings Setup
        settingsView.layer.cornerRadius = settingsView.frame.height / 8
        
        settingsView.layer.shadowColor = UIColor.gray.cgColor
        settingsView.layer.shadowOpacity = 0.2
        settingsView.layer.shadowRadius = 5
        
        settingsButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        settingsButton.setTitle("", for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)$"
    }

    /// Account Actions
    @IBAction func accountPressed(_ sender: Any) {
        performSegue(withIdentifier: "Account", sender: self)
    }
    
    /// Operation Actions
    @IBAction func operationPressed(_ sender: Any) {
        performSegue(withIdentifier: "Operations", sender: self)
    }
    

}

