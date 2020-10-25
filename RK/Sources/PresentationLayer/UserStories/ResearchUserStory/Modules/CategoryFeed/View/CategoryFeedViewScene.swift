//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI
import Combine
import KingfisherSwiftUI
import SkeletonUI

struct CategoryFeedViewScene: ConnectedView {
    struct Props {
        let categories: [CategoriesVO]
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let categories = state.categories
        let appearTrigger = {
            dispatch(Actions.CategoryAction.start)
        }
        return Props(categories: categories, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        NavigationView {
            SkeletonList(with: props.categories, quantity: 6) { (loading: Bool, category: CategoriesVO?) in
                FeedCellView(viewModel: FeedCellViewModel(vo: category, loading: loading),
                        destination: AnyView(ResearchFeedView(categoryId: category?.id ?? 0)))
                        .navigationBarTitle(R.string.localizable.categoryTitle())
                        .font(.largeTitle)
                        .cornerRadius(4)
                        .shadow(radius: 4)
            }
                    .onAppear(perform: props.appearTrigger)
        }
    }
}
