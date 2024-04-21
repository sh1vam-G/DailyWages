//
//  SpinnerView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 21/04/24.
//

import SwiftUI

struct SpinnerView: View {
    
    @State private var progress: Double = 5
    @State private var isAnimating: Bool = true
    
    
    var body: some View {
        ZStack {
            Color.gray.opacity(0.5)
                .edgesIgnoringSafeArea(.all)
            VStack {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle())
                    .scaleEffect(4)
                    .animation(isAnimating ? .easeIn: nil, value: progress)
            }
        }
    }
    
    func start() {
        progress = 5
        isAnimating = true
    }
    func stop() {
        progress = 0
        isAnimating = false
    }
}

#Preview {
    SpinnerView()
}
