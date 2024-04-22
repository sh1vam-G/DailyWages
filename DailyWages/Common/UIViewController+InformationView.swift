//
//  UIViewController+InformationView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import UIKit
import SwiftUI

extension UIViewController {
    func setUpInformationView(msg: String) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            let infoView: UIView = {
                let controller = UIHostingController(rootView: InformationView(msg: msg))
                let view = controller.view ?? UIView()
                view.translatesAutoresizingMaskIntoConstraints = false
                return view
            }()
            
            self.view.addSubview(infoView)
            
            NSLayoutConstraint.activate([
                infoView.topAnchor.constraint(equalTo: self.view.topAnchor),
                infoView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
                infoView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
                infoView.heightAnchor.constraint(equalToConstant: 100)
            ])
            
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(1)) { [weak self] in
                guard let self = self else { return }
                infoView.removeFromSuperview()
            }
        }
        
        
    }
}
