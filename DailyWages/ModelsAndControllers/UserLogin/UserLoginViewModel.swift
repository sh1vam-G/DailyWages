//
//  UserLoginViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import Foundation
import SwiftUI

class UserLoginViewModel {
    var isUserLoggedIn: Bool = false
    private var repository = UserLoginRepository()
    @Published var errorMsg: String = String()
    
    func fetchUserDetails(
        username: String,
        password: String,
        completion: @escaping (Result<Bool,ErrorType>) -> ()
    ) {
        repository.fetchUserData(
            username: username,
            password: password
        ) { (result: Result<SuccessResponseType,ErrorType>) in
            switch result {
            case .success(.successWithResponse(let response)):
                completion(.success(true))
            case .success(.successWithoutResponse):
                completion(.success(false))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func updateViewWithMsg(msg: String) {
        errorMsg = msg
    }
}
