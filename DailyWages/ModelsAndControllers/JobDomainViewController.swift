//
//  JobDomainViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import UIKit

class JobDomainViewController: UIViewController {
    
    private lazy var entryView: JobDomainConnectingView = {
        let view = JobDomainConnectingView(delegate: self)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    static func makeViewController() -> JobDomainViewController {
        let controller = JobDomainViewController()
        controller.configureView()
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setNavigationBarColor(color: UIColor(hex: "#e4e4e4"))
    }
    
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.view.addSubview(entryView)
        self.view.backgroundColor = UIColor(hex: "#e4e4e4")
        
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: entryView.topAnchor, constant: -5),
            self.view.leftAnchor.constraint(equalTo: entryView.leftAnchor),
            self.view.rightAnchor.constraint(equalTo: entryView.rightAnchor),
            self.view.bottomAnchor.constraint(equalTo: entryView.bottomAnchor)
        ])
    }
}

extension JobDomainViewController: JobDomainSelectionDelegate {
    func outsideJobSelected() {
        self.navigationController?.pushViewController(JobListingViewController(), animated: true)
    }
    
    func homeJobSelected() {
        self.navigationController?.pushViewController(JobListingViewController(), animated: true)
    }
    
    
}
