//
// Created by Юрий Трыков on 05.07.2020.
//

import SwiftUI
import SkeletonUI
import struct Kingfisher.KFImage

struct ResearchFeedView: ConnectedView {
    let categoryId: Int
    struct Props {
        let researches: [ResearchesVO]
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let researches = state.categories
                .filter { $0.id == categoryId }
                .flatMap { $0.researches }
        return Props(researches: researches)
    }

    static func body(props: Props) -> some View {
        List(props.researches) { (researches: ResearchesVO) in
            ResearchCellView(viewModel: ResearchCellViewModel(vo: researches))
                    .navigationBarTitle(R.string.localizable.researchTitle())
                    .font(.largeTitle)
        }
    }
}
struct ResearchCellView: View {
    let viewModel: ResearchCellViewModel
    var body: some View {
        VStack {
            Text(viewModel.name)
                    .font(.system(size: 17.0))
            KFImage(viewModel.image)
                    .placeholder { R.image.octocat.image }
                    .resizable()
                    .frame(height: 95)
                    .frame(minWidth: 0, maxWidth: .infinity)
            SummaryView(summary: viewModel.summary)
        }
                .background(Color.white)
                .frame(height: 135)
    }
}
struct SummaryView: View {
    let summary: ResearchSummaryVO?
    var body: some View {
        guard let summary = summary else {
            return AnyView(EmptyView())
        }
        return AnyView(HStack {
            Text(summary.quality)
                    .font(.system(size: 17.0))
                    .foregroundColor(R.color.terracotta.color)
            Text(summary.highQuality)
                    .font(.system(size: 17.0))
                    .foregroundColor(R.color.terracotta.color)
            Text(summary.withSign)
                    .font(.system(size: 17.0))
                    .foregroundColor(R.color.terracotta.color)
            Text(summary.withViolation)
                    .font(.system(size: 17.0))
                    .foregroundColor(R.color.terracotta.color)
        }
                .background(Color.white)
                .frame(height: 40))
    }
}
