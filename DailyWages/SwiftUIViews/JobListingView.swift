//
//  JobListingView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 18/04/24.
//

import SwiftUI

protocol JobListingSelectionProtocol: AnyObject {
    func jobListItemSelectedOf(type: HomeJobTypes)
}

struct JobListingView: View {
    weak var delegate: JobListingSelectionProtocol?
    private var jobs: [HomeJobTypes] = []
    
    init(jobs: [HomeJobTypes], delegate: JobListingSelectionProtocol?) {
        self.jobs = jobs
        self.delegate = delegate
    }
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 40)
            ScrollView {
                ForEach(jobs, id: \.self) { job in
                    JobCellView(job: job)
                        .onTapGesture {
                            delegate?.jobListItemSelectedOf(type: job)
                        }
                }
            }
        }
        .background(Color(uiColor: UIColor(hex: "#eeeeee")))
    }
}

struct JobCellView: View {
    var job: HomeJobTypes
    var body: some View {
        HStack {
            job.getJobsImage()
                .resizable()
                .renderingMode(.template)
                .foregroundColor(.cyan)
                .frame(width: 50, height: 50)
                .cornerRadius(10)
                .padding(.horizontal, 30)
            job.getJobsText()
                .font(Font.custom("", size: 20))
            Spacer()
        }
        .listRowInsets(
            EdgeInsets(
                top: 8,
                leading: 8,
                bottom: 8,
                trailing: 8
            )
        )
        .frame(width: UIScreen.main.bounds.width-40, height: 80)
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 2, x: 0, y: 1)
        .padding(.bottom, 10)
    }
}

enum HomeJobTypes: String, JobListingProtocol {

    case packaging = "PACKAGING"
    case stitching = "STITCHING"
    case laundry = "LAUNDRY"
    case weaver = "WEAVING"
    case stylist = "STYLING"
    case designer = "DESIGNER"
    
    
    func getJobsText() -> Text {
        switch self {
        case .packaging:
            return Text("PACKAGING")
        case .stitching:
            return Text("STITCHING")
        case .laundry:
            return Text("LAUNDRY")
        case .weaver:
            return Text("WEAVING")
        case .stylist:
            return Text("STYLING")
        case .designer:
            return Text("DESIGNING")
        }
    }
    
    func getJobsImage() -> Image {
        switch self {
        case .packaging:
            Image("packaging")
        case .stitching:
            Image("stitching")
        case .laundry:
            Image("laundry")
        case .weaver:
            Image("weaving")
        case .stylist:
            Image("styling")
        case .designer:
            Image("designing")
        }
    }
    
}

#Preview {
    JobListingView(jobs: [.packaging, .stitching, .laundry, .weaver, .stylist, .designer], delegate: nil)
}
