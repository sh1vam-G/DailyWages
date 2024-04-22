//
//  RegisterUsernameViewModel.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import Foundation
import SwiftUI

class RegisterUsernameViewModel {
    var usernameRepo = UserNameRepository()
    var registrationRepo = UserRegistrationRepository()
    var userData = UserRegistrationModel()
    var userRegisterationResponse = UserRegistrationResponseModel()
    @Published var errorMsg: ErrorMsg = ErrorMsg()
    
    init(data: UserRegistrationModel, errorMsg: String) {
        self.userData = data
        self.errorMsg.errorMsg = errorMsg
    }
    
    func isUserNameValid(username: String, completion: @escaping (Result<Bool,Error>)->()) {
        usernameRepo.isUserNameValid(username: username) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(.successWithResponse(let isValid)):
                completion(.success(isValid))
                if !isValid {
                    self.updateErrorMsg(msg:String())
                } else {
                    self.updateErrorMsg(msg:"username unavailable")
                }
            case .success(.successWithoutResponse):
                self.errorMsg.errorMsg = "server error"
                completion(.success(false))
            case .failure(let error):
                switch error {
                case .networkError:
                    self.updateErrorMsg(msg:"network error")
                case .serverError:
                    self.updateErrorMsg(msg:"server error")
                case .incorrectRequest:
                    self.updateErrorMsg(msg:"incorrect request")
                case .unknownStatus:
                    self.updateErrorMsg(msg:"try again later")
                }
                completion(.failure(ErrorType.unknownStatus))
            }
        }
    }
    
    func registerUser(
        username: String,
        pass: String,
        completion: @escaping (Result<Bool,Error>) -> ()
    ) {
        let userModel = UserRegistrationRequestModel.createModel(using: userData)
        let bodyParams = userModel.covertIntoBodyParams()
        registrationRepo.registerUser(
            bodyParams: bodyParams
        ) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(.successWithResponse(let model)):
                if model.login {
                    self.userRegisterationResponse = model
                    UserProfileInformation.saveUserDetails(user: UserLoginInfoModel(id: String(model.id), username: username, password: pass))
                    completion(.success(true))
                } else {
                    completion(.success(false))
                }
            case .success(.successWithoutResponse):
                completion(.success(false))
            case .failure(let error):
                switch error {
                case .networkError:
                    self.updateErrorMsg(msg:"network error")
                case .serverError:
                    self.updateErrorMsg(msg:"server error")
                case .incorrectRequest:
                    self.updateErrorMsg(msg:"incorrect request")
                case .unknownStatus:
                    self.updateErrorMsg(msg:"try again later")
                }
                completion(.failure(ErrorType.unknownStatus))
            }
        }
    }
    
    func updateErrorMsg(msg: String) {
        DispatchQueue.main.async {
            self.errorMsg.errorMsg = msg
        }
    }
}
