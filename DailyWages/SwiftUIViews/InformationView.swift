//
//  informationView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 22/04/24.
//

import SwiftUI

struct InformationView: View {
    var msg: String = String()
    
    init(msg: String) {
        self.msg = msg
    }
    var body: some View {
        Spacer()
            .frame(height: 200)
        Text(msg)
            .frame(maxWidth: .infinity)
            .frame(height: 100)
            .background(Color.gray)
            .foregroundColor(Color.white)
            .cornerRadius(20)
            .padding(20)
            
    }
}

#Preview {
    InformationView(msg: "some msg")
}
