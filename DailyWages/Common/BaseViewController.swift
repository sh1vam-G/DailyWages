//
//  BaseViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.tintColor = UIColor.systemTeal
        self.navigationController?.isNavigationBarHidden = false
        print("came to base view controller")
    }
}
