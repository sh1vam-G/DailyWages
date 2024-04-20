//
//  JobListingView.swift
//  DailyWages
//
//  Created by Shivam Gupta on 18/04/24.
//

import SwiftUI

struct Jobs {
    let id: UUID
    let jobs: [HomeJobTypes]
}

struct JobListingView: View {
    private var
    jobs: Jobs = Jobs(id: UUID(), jobs: [.packaging, .stitching, .laundry, .weaver, .stylist, .designer])
    
    init(jobs: Jobs) {
        self.jobs = jobs
    }
    var body: some View {
//        ForEach(jobs.jobs, id: \.id) { job in
        JobCellView(job: jobs.jobs[0])
//        }
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
                .frame(width: 60, height: 60)
                .cornerRadius(10)
                .padding(.horizontal, 30)
            job.getJobsText()
                .font(Font.custom("", size: 25))
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
        .frame(width: UIScreen.main.bounds.width-40, height: 100)
        .background(Color(uiColor: UIColor(hex: "#e4e4e4")))
        .cornerRadius(10)
        .shadow(color: Color.gray, radius: 2, x: 0, y: 1)
    }
}

enum HomeJobTypes: JobListingProtocol {

    case packaging
    case stitching
    case laundry
    case weaver
    case stylist
    case designer
    
    
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
    JobListingView(jobs: Jobs(id: UUID(), jobs: []))
}
