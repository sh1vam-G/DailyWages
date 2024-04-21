//
//  ViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 18/04/24.
//

import UIKit

class ViewController: BaseViewController {

    let viewController = JobDomainViewController.makeViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemTeal
        
        self.navigationController?.setViewControllers([viewController], animated: true)
    }
}

