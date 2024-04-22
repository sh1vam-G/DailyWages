//
//  JobDomainView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 19/04/24.
//

import SwiftUI

protocol JobDomainSelectionDelegate: AnyObject {
    func outsideJobSelected()
    func homeJobSelected()
}
struct JobDomainView: View {
    private var delegate: JobDomainSelectionDelegate?
    
    init(delegate: JobDomainSelectionDelegate?) {
        self.delegate = delegate
    }
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 10)
            Text("SEARCHING FOR?")
                .foregroundColor(.black)
                .font(Font.custom("", size: 30))
                .frame(width: UIScreen.main.bounds.width-80, height: 200)
                
                VStack {
                    Text("JOB OUTSIDE")
                        .foregroundColor(.black)
                        .font(Font.custom("", size: 30))
                        .fontWeight(.bold)
                        .frame(width: UIScreen.main.bounds.width-40 ,height: 150)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 4,x: 0, y:4)
                        .onTapGesture {
                            delegate?.outsideJobSelected()
                        }
                        
                    Spacer()
                        .frame(height: 40)
                    Text("JOB AT HOME").font(Font.custom("", size: 30))
                        .foregroundColor(.black)
                        .frame(width: UIScreen.main.bounds.width-40 ,height: 150)
                        .background(Color.white)
                        .cornerRadius(20)
                        .shadow(color: .gray, radius: 4,x: 0, y:4)
                        .onTapGesture {
                            delegate?.homeJobSelected()
                        }
                }
        }
        
        .frame(maxWidth: .infinity)
        .background(Color(uiColor: UIColor(hex: "#e4e4e4")))
    }
}

#Preview {
    JobDomainView(delegate: nil)
}
