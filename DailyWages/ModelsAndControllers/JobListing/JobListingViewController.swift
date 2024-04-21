//
//  JobListingViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 18/04/24.
//

import UIKit
import SwiftUI

class JobListingViewController: UIViewController {
    
    var jobListingViewModel: JobListingViewModel = JobListingViewModel()
    
    private lazy var listingView: UIView = {
        let controller = UIHostingController(rootView: JobListingView(jobs: self.jobListingViewModel.jobDomainList, delegate: self))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(hex: "#eeeeee")
        return view
    }()
    
    convenience init(jobListingViewModel: JobListingViewModel) {
        self.init()
        self.jobListingViewModel = jobListingViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewHierarchy()
        configureViewConstraints()
        self.setTitle(title: "OPTIONS FOR YOU")
        self.setUpDefaultNavigationController()
        self.setRightBarButtonItemToUserLogin()
    }
    
    
    func configureViewHierarchy() {
        self.view.addSubview(listingView)
        self.view.backgroundColor = UIColor(hex: "#eeeeee")
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: listingView.topAnchor),
            self.view.bottomAnchor.constraint(equalTo: listingView.bottomAnchor),
            self.view.leftAnchor.constraint(equalTo: listingView.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: listingView.rightAnchor)
        ])
    }
    
    
}

extension JobListingViewController: JobListingSelectionProtocol {
    func jobListItemSelectedOf(type: HomeJobTypes) {
        let viewModel = JobDetailListingViewModel(type: type)
        let controller = JobDetailListingViewController(viewModel: viewModel)
        controller.view.backgroundColor = UIColor(hex: "#eeeeee")
        self.navigationController?.pushViewController(controller, animated: false)
    }
}
