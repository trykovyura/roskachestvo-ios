//
// Created by Юрий Трыков on 05.07.2020.
//

import SwiftUI
import SkeletonUI
import KingfisherSwiftUI

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
        // LazyVStack instead of List because of separators
        ScrollView {
            LazyVStack {
                ForEach(props.researches, id: \.self) { researches in
                    let destination = AnyView(ProductFeedView(researchId: researches.id.description))
                    NavigationLink(destination: destination) {
                            FeedCellView(viewModel: FeedCellViewModel(vo: researches, loading: false),
                                    destination: AnyView(ProductFeedView(researchId: researches.id.description)))
                                    .navigationBarTitle(R.string.localizable.researchTitle())
                                    .font(.largeTitle)
                                    .cornerRadius(4)
                                    .shadow(radius: 4)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                    }
                }
            }
        }
    }
}
