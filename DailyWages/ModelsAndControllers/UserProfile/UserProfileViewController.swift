//
//  UserProfileViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit
import SwiftUI

class UserProfileViewController: BaseViewController {

    var viewModel: UserProfileViewModel = UserProfileViewModel(userData: UserLoginDomainModel())
    private lazy var profileView: UIView = {
        let controller = UIHostingController(rootView: UserProfileView(userData: viewModel.userProfileData, delegate: self))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "profile")
        self.setUpDefaultNavigationController()
    }
    
    convenience init(viewModel: UserProfileViewModel) {
        self.init()
        self.viewModel = viewModel
        configureView()
    }

    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(profileView)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            profileView.topAnchor.constraint(equalTo: self.view.topAnchor),
            profileView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            profileView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            profileView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    func navigateToJobDescriptionVC(job: JobListDomainModel) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let viewModel = JobDescriptionViewModel(job: job)
            let controller = JobDescriptionViewController(viewModel: viewModel)
            self.navigationController?.pushViewController(controller, animated: false)
        }
    }
    
    func navigateToJobListingVC() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UserProfileInformation.clearUserDetails()
            self.navigationController?.setViewControllers([JobDomainViewController.makeViewController()], animated: false)
        }
    }
}

extension UserProfileViewController: userProfileProtocol {
    func jobSelected(job: JobListDomainModel) {
        self.navigateToJobDescriptionVC(job: job)
    }
    
    func logoutButtonTapped() {
        self.navigateToJobListingVC()
    }
    
}
