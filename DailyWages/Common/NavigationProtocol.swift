//
//  NavigationProtocol.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import UIKit

protocol NavigationProtocol {
    func backButtonTapped()
    func navigationBarTitle()
}

class CustomNavigationController: UINavigationController {
//    let navigationController = UINavigationController(rootViewController: ViewController())
}

extension CustomNavigationController: NavigationProtocol {
    func backButtonTapped() {
        //todo
    }
    
    func navigationBarTitle() {
        //todo
    }
    
    
}

extension UIViewController {
    
}
