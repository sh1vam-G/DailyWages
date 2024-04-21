//
//  BaseViewController.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import UIKit
import SwiftUI

class BaseViewController: UIViewController {

    private lazy var spinView = SpinnerView()
    private lazy var spinnerView: UIView = {
        let controller = UIHostingController(rootView: spinView)
        let view = controller.view ?? UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func addSpinnerView() {
        self.view.addSubview(spinnerView)
        setUpConstraintsForSpinner()
        spinView.start()
    }
    
    func setUpConstraintsForSpinner() {
        NSLayoutConstraint.activate([
            spinnerView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            spinnerView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            spinnerView.topAnchor.constraint(equalTo: self.view.topAnchor),
            spinnerView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    func removeSpinnerView() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.spinnerView.removeFromSuperview()
            self.spinView.stop()
        }
    }
}
