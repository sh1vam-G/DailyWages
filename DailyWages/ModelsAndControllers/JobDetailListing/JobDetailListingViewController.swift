//
//  JobDetailListingViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit
import SwiftUI

class JobDetailListingViewController: BaseViewController {

    var jobListingDetailViewModel: JobDetailListingViewModel?
    
    private lazy var listingView: UIView = {
        var view = UIView()
        
        if jobListingDetailViewModel?.getJobAsPerType() != [] {
            let controller = UIHostingController(rootView: JobDetailListingView(jobs: jobListingDetailViewModel?.getJobAsPerType() ?? []))
            view = controller.view ?? UIView()
        } else {
            let controller = UIHostingController(rootView: ErrorView(errorMsg: "NO JOBS AVAILABLE IN THIS CATEGORY"))
            view = controller.view ?? UIView()
        }
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "JOBS NEAR YOU")
        self.setUpDefaultNavigationController()
        self.fetchJobs()
        self.view.backgroundColor = UIColor(hex: "#eeeeee")
    }
    
    convenience init(viewModel: JobDetailListingViewModel) {
        self.init()
        self.jobListingDetailViewModel = viewModel
        self.view.backgroundColor = UIColor(hex: "#eeeeee")
    }
    
    func fetchJobs() {
        self.addSpinnerView()
        jobListingDetailViewModel?.prepareJobsList { [weak self] result in
            guard let self = self else { return }
            self.removeSpinnerView()
            switch result {
            case .success(let isValid):
                if !isValid {
                    self.configureErrorView(msg: "Sorry no jobs available currently")
                }
                
                configureView()
            case .failure(let error):
                switch error {
                case .networkError:
                    self.configureErrorView(msg: "network Error")
                case .serverError:
                    self.configureErrorView(msg: "Server Error")
                case .incorrectRequest:
                    self.configureErrorView(msg: "Incorrect Request")
                case .unknownStatus:
                    self.configureErrorView(msg: "Some unkown Error Occured")
                }
            }
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
            
            self.listingView.removeFromSuperview()
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
    
    func configureView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.configureViewHierarchy()
            self.configureViewConstraints()
        }
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(listingView)
        self.setNavigationBarColor(color: UIColor.white)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            listingView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            listingView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            listingView.topAnchor.constraint(equalTo: self.view.topAnchor),
            listingView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}
