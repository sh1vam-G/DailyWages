//
//  ViewConformanceProtocol.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import Foundation

protocol ViewConfirmanceProtocol {
    func configureViewHierarchy()
    func configureViewConstraints()
}

class ViewConfirmance: ViewConfirmanceProtocol {
    func configureView() {
        configureViewHierarchy()
        configureViewConstraints()
    }
    
    func configureViewHierarchy() {
        
    }
    func configureViewConstraints() {
        
    }
}
