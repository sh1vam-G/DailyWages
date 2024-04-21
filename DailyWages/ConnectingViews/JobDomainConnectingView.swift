//
//  JobDomainConnectingView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import UIKit
import SwiftUI

class JobDomainConnectingView: UIView {
    
    weak var delegate: JobDomainSelectionDelegate?
    
    private lazy var jobDomainView: UIView = {
        let hostingController = UIHostingController(rootView: JobDomainView(delegate: self))
        let view = hostingController.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    convenience init(delegate: JobDomainSelectionDelegate?) {
        self.init()
        self.delegate = delegate
        configureView()
    }
    
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        self.addSubview(jobDomainView)
    }
    
    func configureViewConstraints() {
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: jobDomainView.topAnchor),
            self.leftAnchor.constraint(equalTo: jobDomainView.leftAnchor),
            self.rightAnchor.constraint(equalTo: jobDomainView.rightAnchor)
        ])
    }
}

extension JobDomainConnectingView: JobDomainSelectionDelegate {
    func outsideJobSelected() {
        self.delegate?.outsideJobSelected()
    }
    
    func homeJobSelected() {
        self.delegate?.homeJobSelected()
    }
}
