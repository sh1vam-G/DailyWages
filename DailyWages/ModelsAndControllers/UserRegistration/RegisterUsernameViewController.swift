//
//  RegisterUsernameViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import UIKit
import SwiftUI

class RegisterUsernameViewController: UIViewController {

    var viewModel = RegisterUsernameViewModel(data: UserRegistrationModel(), errorMsg: "fields should not be empty")
    var userWorkItem: DispatchWorkItem?
    
    private lazy var registerUsernameView: UIView = {
        let controller = UIHostingController(rootView: RegisterUsernameView(delegate: self, errorMsg: viewModel.errorMsg))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureView()
        self.setTitle(title: "Register Username")
//        self.setUpDefaultNavigationController()
    }
    
    convenience init(viewModel: RegisterUsernameViewModel)  {
        self.init()
        self.viewModel = viewModel
    }
    
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(registerUsernameView)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            registerUsernameView.topAnchor.constraint(equalTo: self.view.topAnchor),
            registerUsernameView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            registerUsernameView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            registerUsernameView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func checkUserAvailability(text: String) {
        userWorkItem?.cancel()
        let workItem: DispatchWorkItem = DispatchWorkItem { [weak self] in
            guard let self = self else { return }
            self.viewModel.isUserNameValid(username: text) { result in
                switch result {
                case .success(let bool):
                    if bool {
                        print("username found")
                    } else {
                        print("username not found")
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
        userWorkItem = workItem
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1), execute: workItem)
    }
    
    func registerUser(userName: String, pass: String) {
        self.viewModel.registerUser(
            username: userName,
            pass: pass
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let bool):
                if bool {
                    navigateToJobDomainVC()
                }
            case .failure(let error):
                break
            }
        }
    }
    
    func navigateToJobDomainVC() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.navigationController?.setViewControllers([JobDomainViewController.makeViewController()], animated: false)
        }
    }
}

extension RegisterUsernameViewController: RegisterUsernameDelegate {
    func usernameChanged(text: String) {
        checkUserAvailability(text: text)
    }
    
    func registerButtonTapped(username: String, pass: String) {
        
    }
}
