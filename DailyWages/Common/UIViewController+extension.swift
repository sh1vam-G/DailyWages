//
//  UIViewController+extension.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import UIKit

extension UIViewController {
    func setUpDefaultNavigationController() {
        let image = UIImage(named: "chevron_left")?.withRenderingMode(.alwaysOriginal) ?? UIImage()
        
        let resizedImage = image.resizableImage(withCapInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), resizingMode: .stretch)
        
        let leftItem = UIBarButtonItem(
            image: resizedImage,
            style: .done,
            target: self,
            action: #selector(backButtonTapped)
        )
        leftItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        self.navigationItem.leftBarButtonItem = leftItem
        self.setNavigationBarColor(color: UIColor.white)
        
    }
    
    @objc func backButtonTapped() {
        self.navigationController?.popViewController(animated: true)
    }
    
    func setNavigationBarColor(color: UIColor) {
        self.navigationController?.navigationBar.backgroundColor = color
        
        let safeArea: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = color
            return view
        }()
        self.view.addSubview(safeArea)
        let guide = view.safeAreaLayoutGuide
        NSLayoutConstraint.activate([
            safeArea.bottomAnchor.constraint(equalTo: guide.topAnchor),
            safeArea.heightAnchor.constraint(equalToConstant: 200),
            safeArea.widthAnchor.constraint(equalToConstant: 2000)
        ])
    }
    
    func setTitle(title: String) {
        self.title = title
    }
    
    func setRightBarButtonItemToUserLogin() {
        let image = UIImage(named: "user_symbol")?.withRenderingMode(.alwaysOriginal) ?? UIImage()
        
        let resizedImage = image.resizableImage(withCapInsets: UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8), resizingMode: .stretch)
        
        let leftItem = UIBarButtonItem(
            image: resizedImage,
            style: .done,
            target: self,
            action: #selector(openUserProfile)
        )
        leftItem.imageInsets = UIEdgeInsets(top: 0, left: -20, bottom: 0, right: 0)
        self.navigationItem.rightBarButtonItem = leftItem
    }
    
    @objc func openUserProfile() {
        self.navigationController?.pushViewController(UserLoginViewController(), animated: false)
    }
    
}
