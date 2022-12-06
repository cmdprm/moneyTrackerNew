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
    
    @IBOutlet weak var operationNameLabel: UILabel!
    @IBOutlet weak var operationBalanceLabel: UILabel!
    
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
        view.backgroundColor = UIColor(named: "Background")
        
        /// Account Setup
        accountView.layer.cornerRadius = accountView.frame.height / 8
        
        accountView.layer.shadowColor = UIColor.gray.cgColor
        accountView.layer.shadowOpacity = 0.2
        accountView.layer.shadowRadius = 5
        
        accountView.backgroundColor = UIColor(named: "Color 1")
        
        accountButton.layer.cornerRadius = accountButton.frame.height / 8
        accountButton.setTitle("", for: .normal)
        
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)\(currency)"
        
        /// Operation Setup
        lastOperationView.layer.cornerRadius = lastOperationView.frame.height / 8
        
        lastOperationView.layer.shadowColor = UIColor.gray.cgColor
        lastOperationView.layer.shadowOpacity = 0.2
        lastOperationView.layer.shadowRadius = 5
        
        lastOperationView.backgroundColor = UIColor(named: "Color 1")
        
        lastOperationButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        lastOperationButton.setTitle("", for: .normal)
        
        let lastOperation = operations[0][0]
        
        operationNameLabel.text = "\(lastOperation.title)"
        
        if lastOperation.status == 0 {
            operationBalanceLabel.textColor = UIColor(red: 0.85, green: 0.26, blue: 0.08, alpha: 1.00)
            operationBalanceLabel.text = "-\(lastOperation.amount)\(currency)"
        } else {
            operationBalanceLabel.textColor = UIColor(red: 0.18, green: 0.49, blue: 0.20, alpha: 1.00)
            operationBalanceLabel.text = "+\(lastOperation.amount)\(currency)"
        }
        
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
        
        settingsView.backgroundColor = UIColor(named: "Color 2")
        
        settingsButton.layer.cornerRadius = lastOperationButton.frame.height / 8
        settingsButton.setTitle("", for: .normal)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        /// Account
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)\(currency)"
        
        /// LastOperation
        let lastOperation = operations[0][0]
        
        operationNameLabel.text = "\(lastOperation.title)"
        
        if lastOperation.status == 0 {
            operationBalanceLabel.textColor = UIColor(red: 0.85, green: 0.26, blue: 0.08, alpha: 1.00)
            operationBalanceLabel.text = "-\(lastOperation.amount)\(currency)"
        } else {
            operationBalanceLabel.textColor = UIColor(red: 0.18, green: 0.49, blue: 0.20, alpha: 1.00)
            operationBalanceLabel.text = "+\(lastOperation.amount)\(currency)"
        }
    }

    /// Account Actions
    @IBAction func accountPressed(_ sender: Any) {
        performSegue(withIdentifier: "Account", sender: self)
    }
    
    /// Operation Actions
    @IBAction func operationPressed(_ sender: Any) {
        performSegue(withIdentifier: "Operations", sender: self)
    }
    
    @IBAction func incomePressed(_ sender: Any) {
        performSegue(withIdentifier: "Income", sender: self)
    }
    
    @IBAction func wastePressed(_ sender: Any) {
        performSegue(withIdentifier: "Waste", sender: self)
    }
    
    @IBAction func settingsPressed(_ sender: Any) {
        performSegue(withIdentifier: "Settings", sender: self)
    }
}

