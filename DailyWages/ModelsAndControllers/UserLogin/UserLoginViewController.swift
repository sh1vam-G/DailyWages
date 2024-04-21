//
//  UserLoginViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit
import SwiftUI

class UserLoginViewController: UIViewController {

    private lazy var userLoginView: UIView = {
        let controller = UIHostingController(rootView: UserLoginView(delegate: self))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let user = UserProfileInformation.getUserDetails() {
            self.navigateToUserProfileVC()
        } else {
            configureView()
        }
        
    }
    
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(userLoginView)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            self.userLoginView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.userLoginView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.userLoginView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.userLoginView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func navigateToUserProfileVC() {
        var viewControllers = navigationController?.viewControllers ?? []
        viewControllers.removeLast()
        viewControllers.append(UserProfileViewController())
        self.navigationController?.setViewControllers(viewControllers, animated: false)
    }
}

extension UserLoginViewController: LoginButtonDelegate {
    func loginButtonTapped(username: String, password: String) {
        self.navigateToUserProfileVC()
    }
}
