//
//  ErrorView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 20/04/24.
//

import SwiftUI

struct ErrorView: View {

    var errorMsg: String
    var body: some View {
        VStack {
            Image("circularAlert")
                .resizable()
                .frame(width: 100, height: 100)
            Text(errorMsg)
                .font(Font.custom("", size: 20))
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(uiColor: UIColor(hex: "#eeeeee")))
        
    }
}

#Preview {
    ErrorView(errorMsg: "Error MSG")
}
