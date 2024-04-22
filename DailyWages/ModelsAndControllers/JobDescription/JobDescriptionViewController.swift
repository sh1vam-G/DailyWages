//
//  JobDescriptionViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit
import SwiftUI

class JobDescriptionViewController: BaseViewController {

    var viewModel: JobDescriptionViewModel = JobDescriptionViewModel(job: JobListDomainModel())
    private lazy var jobDescriptionView: UIView = {
        let controller = UIHostingController(rootView: JobDescriptionView(jobs: viewModel.job, delegate: self, status: viewModel.job.status ?? String()))
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTitle(title: "Job Description".uppercased())
        self.setUpDefaultNavigationController()
    }
    
    convenience init(viewModel: JobDescriptionViewModel) {
        self.init()
        self.viewModel = viewModel
        self.configureView()
    }
    
    func configureView() {
        self.configureViewHierarchy()
        self.configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(jobDescriptionView)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            jobDescriptionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            jobDescriptionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            jobDescriptionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            jobDescriptionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
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
            
            self.jobDescriptionView.removeFromSuperview()
            self.view.addSubview(errorMsgView)
            self.view.backgroundColor = UIColor(hex: "#eeeeee")
            self.setTitle(title: "OOPS!!!")
            self.setUpDefaultNavigationController()
            
            NSLayoutConstraint.activate([
                errorMsgView.topAnchor.constraint(equalTo: self.view.topAnchor),
                errorMsgView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
                errorMsgView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                errorMsgView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
            ])
        }
    }
    
    func navigateToJobDomainPage() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.navigationController?.setViewControllers([JobDomainViewController.makeViewController()], animated: false)
        }
    }
}

extension JobDescriptionViewController: JobAcceptanceDelegate {
    func jobCancelled(jobId: Int) {
        viewModel.updateJob(
            status: "UNASSIGNED",
            jobId: String(jobId)
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(.successWithResponse(let valid)):
                break
            case .success(.successWithoutResponse):
                break
            case .failure(let error):
                switch error {
                case .networkError:
                    self.configureErrorView(msg: "network issue")
                case .serverError:
                    self.configureErrorView(msg: "Server error")
                case .incorrectRequest:
                    self.configureErrorView(msg: "Incorrect Request")
                case .unknownStatus:
                    self.configureErrorView(msg: "Status Unknown")
                }
            }
        }
    }
    
    
    func jobAccepted(jobId: Int) {
        viewModel.updateJob(
            status: "PROGRESS",
            jobId: String(jobId)
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(.successWithResponse(let valid)):
                self.navigateToJobDomainPage()
            case .success(.successWithoutResponse):
                self.configureErrorView(msg: "Not able to assign Job")
            case .failure(let error):
                switch error {
                case .networkError:
                    self.configureErrorView(msg: "network issue")
                case .serverError:
                    self.configureErrorView(msg: "Server error")
                case .incorrectRequest:
                    self.configureErrorView(msg: "Incorrect Request")
                case .unknownStatus:
                    self.configureErrorView(msg: "Status Unknown")
                }
            }
        }
    }
    func cancelButtonTapped() {
        self.backButtonTapped()
    }
}
