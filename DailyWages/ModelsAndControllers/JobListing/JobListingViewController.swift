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
        let controller = UIHostingController(rootView: JobListingView(jobs: self.jobListingViewModel.jobDomainList))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    convenience init(jobListingViewModel: JobListingViewModel) {
        self.init()
        self.jobListingViewModel = jobListingViewModel
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    func configureViewHierarchy() {
        self.view.addSubview(listingView)
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
