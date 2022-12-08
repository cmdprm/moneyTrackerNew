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
    
    var layout = SetupLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "Background")

        accountView.backgroundColor = UIColor(named: "Color 1")
        lastOperationView.backgroundColor = UIColor(named: "Color 1")
        settingsView.backgroundColor = UIColor(named: "Color 2")
        
        layout.setLayout(button: accountButton, view: accountView, isMain: true)
        layout.setLayout(button: lastOperationButton, view: lastOperationView, isMain: true)
        layout.setLayout(button: incomeButton, view: incomeView, isMain: true)
        layout.setLayout(button: wasteButton, view: wasteView, isMain: true)
        layout.setLayout(button: settingsButton, view: settingsView, isMain: true)
        
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)\(currency)"
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        var primaryAccount = accounts[0]
        
        for account in accounts {
            if account.isMain == true {
                primaryAccount = account
            }
        }
        
        accountNameLabel.text = "\(primaryAccount.name) Account"
        accountAmountLabel.text = "\(primaryAccount.balance)\(currency)"
        
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

    @IBAction func accountPressed(_ sender: Any) {
        performSegue(withIdentifier: "Account", sender: self)
    }
    
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

