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
        self.setTitle(title: "Login Required")
        self.setUpDefaultNavigationController()
        if let user = UserProfileInformation.getUserDetails() {
            self.fetchUserDetails(username: user.username, password: user.password)
        } else {
            configureView()
        }
        
    }
    
    func fetchUserDetails(
        username: String,
        password: String
    ) {
        self.addSpinnerView()
        loginViewModel.fetchUserDetails(
            username: username,
            password: password
        ) { [weak self] result in
            guard let self = self else { return }
            self.removeSpinnerView()
            switch result {
            case .success(let isValid):
                if isValid {
                    self.navigateToUserProfileVC()
                }
            case .failure(let error):
                UserProfileInformation.clearUserDetails()
                switch error {
                case .networkError:
                    self.configureErrorView(msg: "network error try again later")
                case .serverError:
                    self.configureErrorView(msg: "server error try again later")
                case .incorrectRequest:
                    self.configureErrorView(msg: "incorrect username or password")
                case .unknownStatus:
                    self.configureErrorView(msg: "some error fetching the details")
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
        self.setUpDefaultNavigationController()
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
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let viewModel = UserProfileViewModel(userData: loginViewModel.userData)
            var viewControllers = navigationController?.viewControllers ?? []
            viewControllers.removeLast()
            viewControllers.append(UserProfileViewController(viewModel: viewModel))
            self.navigationController?.setViewControllers(viewControllers, animated: false)
        }
    }
    
    func navigateToUserRegistrationVC() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            var viewControllers = navigationController?.viewControllers ?? []
            viewControllers.removeLast()
            viewControllers.append(UserRegistrationController())
            self.navigationController?.setViewControllers(viewControllers, animated: false)
        }
    }
    
    
    func configureErrorView(msg: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let errorMsgView: UIView = {
                let controller = UIHostingController(rootView: ErrorView(errorMsg: msg))
                let view = controller.view ?? UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
//            self.listingView.removeFromSuperview()
            self.view.addSubview(errorMsgView)
            self.view.backgroundColor = UIColor(hex: "#eeeeee")
            self.setTitle(title: "OOPS!!!")
            
            NSLayoutConstraint.activate([
                errorMsgView.topAnchor.constraint(equalTo: self.view.topAnchor),
                errorMsgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                errorMsgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                errorMsgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
    }
}

extension UserLoginViewController: LoginButtonDelegate {
    func registerButtonTapped() {
        self.navigateToUserRegistrationVC()
    }
    
    func loginButtonTapped(username: String, password: String) {
        self.fetchUserDetails(username: username, password: password)
    }
}
