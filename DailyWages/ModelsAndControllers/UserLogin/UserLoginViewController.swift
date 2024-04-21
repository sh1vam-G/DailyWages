//
//  UserLoginViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit
import SwiftUI

class UserLoginViewController: BaseViewController {

    var loginViewModel: UserLoginViewModel = UserLoginViewModel()
    
    private lazy var userLoginView: UIView = {
        let controller = UIHostingController(rootView: UserLoginView(delegate: self, errorMsg: loginViewModel.errorMsg))
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
    
    func fetchUserDetails(
        username: String,
        password: String
    ) {
        loginViewModel.fetchUserDetails(
            username: username,
            password: password
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let isValid):
                if isValid {
                    self.navigateToUserProfileVC()
                } else {
                    break
                }
            case .failure(let error):
                switch error {
                case .networkError:
                    loginViewModel.updateViewWithMsg(msg: "network error try again later")
                case .serverError:
                    loginViewModel.updateViewWithMsg(msg: "server error try again later")
                case .incorrectRequest:
                    loginViewModel.updateViewWithMsg(msg: "incorrect username or password")
                case .unknownStatus:
                    loginViewModel.updateViewWithMsg(msg: "some error fetching the details")
                }
            }
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
    
    func navigateToUserRegistrationVC() {
        var viewControllers = navigationController?.viewControllers ?? []
        viewControllers.removeLast()
        viewControllers.append(UserRegistrationController())
        self.navigationController?.setViewControllers(viewControllers, animated: false)
    }
}

extension UserLoginViewController: LoginButtonDelegate {
    func registerButtonTapped() {
        self.navigateToUserRegistrationVC()
    }
    
    func loginButtonTapped(username: String, password: String) {
        self.navigateToUserProfileVC()
    }
}
