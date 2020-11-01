//
// Created by Юрий Трыков on 05.07.2020.
//

import SwiftUI
import SkeletonUI

struct ResearchFeedView: ConnectedView {
    let categoryId: Int
    struct Props {
        let researches: [ResearchesVO]
        let columns: [GridItem]
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let researches = state.categories
                .filter { $0.id == categoryId }
                .flatMap { $0.researches }
        let columns = [
            GridItem(.flexible(), spacing: 20),
            GridItem(.flexible(), spacing: 20)
        ]
        return Props(researches: researches, columns: columns)
    }

    static func body(props: Props) -> some View {
        // LazyVStack instead of List because of separators
        ScrollView {
            LazyVGrid(columns: props.columns, spacing: 20) {
                ForEach(props.researches, id: \.self) { researches in
                    let destination = AnyView(ProductFeedView(researchId: researches.id.description))
                    NavigationLink(destination: destination) {
                            FeedCellView(viewModel: FeedCellViewModel(vo: researches, loading: false))
                                    .navigationBarTitle(R.string.localizable.researchTitle())
                                    .font(.largeTitle)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
