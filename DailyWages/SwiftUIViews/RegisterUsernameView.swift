//
//  RegisterUsernameView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI
import Combine

protocol RegisterUsernameDelegate: AnyObject {
    func usernameChanged(text: String)
    func registerButtonTapped(username: String, pass: String)
}

class ErrorMsg: ObservableObject {
    @Published var errorMsg: String = String()
}

struct RegisterUsernameView: View {
    
    @State private var username: String = String()
    @State private var password: String = String()
    @State private var isPassVisible: Bool = false
    @ObservedObject var errorMsg: ErrorMsg
    
    weak var delegate: RegisterUsernameDelegate?
    
    init(
        delegate: RegisterUsernameDelegate?,
        errorMsg: ErrorMsg
    ) {
        self.delegate = delegate
        self.errorMsg = errorMsg
    }
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                TextField("Username", text: $username)
                    .frame(height: 20)
                    .padding(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(10)
                    .textInputAutocapitalization(.none)
                    .onChange(of: username) { newValue in
                        if(username.count > 3) {
                            delegate?.usernameChanged(text: username)
                        } else {
                            errorMsg.errorMsg = "username should be more than 3 characters"
                        }
                    }
                
                ZStack(alignment: .trailing) {
                    if isPassVisible {
                        TextField("Password", text: $password)
                            .frame(height: 20)
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(10)
                            .textInputAutocapitalization(.none)
                    } else {
                        SecureField("Password", text: $password)
                            .frame(height: 20)
                            .padding(20)
                            .background(Color.white)
                            .cornerRadius(20)
                            .padding(10)
                            .textInputAutocapitalization(.none)
                    }
                    
                    Button(action: {
                        isPassVisible.toggle()
                    }) {
                        Image(systemName: isPassVisible ? "eye": "eye.slash")
                            .foregroundColor(.black.opacity(0.5))
                    }
                    .padding(.trailing, 20)
                }
                
                Text(errorMsg.errorMsg)
                    .foregroundColor(.red)
                
                Button("Register") {
                    delegate?.registerButtonTapped(username: username, pass: password)
                }
                .padding(30)
                .background(errorMsg.errorMsg == String() ? Color.teal : Color(uiColor:UIColor(hex: "#e4e4e4")))
                .cornerRadius(20)
                .foregroundColor(.white)
                .padding(20)
                .disabled(errorMsg.errorMsg == String())
                
            }
            .background(Color(uiColor: UIColor(hex: "#eeeeee")))
            .cornerRadius(20)
            .padding(50)
            .shadow(color: .gray, radius: 2, x: 0, y: 1)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.5))
    }
}

#Preview {
    RegisterUsernameView(delegate: nil, errorMsg: ErrorMsg())
}
