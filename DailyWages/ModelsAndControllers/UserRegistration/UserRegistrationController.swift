//
//  navigateToUserRegistrationController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit
import SwiftUI

class UserRegistrationController: UIViewController {

    private lazy var registerView: UIView = {
        let controller = UIHostingController(rootView: UserRegistrationView(delegate: self))
        let view = controller.view  ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpDefaultNavigationController()
        self.setTitle(title: "Registration")
        self.configureView()
    }
    
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(registerView)
        self.view.backgroundColor = .white
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            registerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            registerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            registerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            registerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }

    func navigateToRegisterUsernameVC(userData: UserRegistrationModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let viewModel = RegisterUsernameViewModel(data: userData, errorMsg: "fields should not be empty")
            let controller = RegisterUsernameViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
}

extension UserRegistrationController: UserRegistrationProtocol {
    func doneButtonTapped(userData: UserRegistrationModel) {
        navigateToRegisterUsernameVC(userData: userData)
    }
    
    func cancelButtonTapped() {
        self.backButtonTapped()
    }
}
