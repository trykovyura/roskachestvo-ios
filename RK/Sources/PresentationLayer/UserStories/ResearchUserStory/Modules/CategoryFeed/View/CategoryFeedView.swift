//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI
import Combine
import SkeletonUI

struct CategoryFeedView: ConnectedView {
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
            ScrollView {
                LazyVStack(spacing: 20) {
                    ForEach(props.categories, id: \.self) { category in
                        let destination = AnyView(ResearchFeedView(categoryId: category.id ?? 0))
                        NavigationLink(destination: destination) {
                            FeedCellView(viewModel: FeedCellViewModel(vo: category, loading: false))
                                    .navigationBarTitle(R.string.localizable.categoryTitle())
                                    .font(.largeTitle)
                                    .cornerRadius(10)
                                    .shadow(radius: 4)
                        }
                    }
                }
                        .padding(.horizontal)
            }
            .onAppear(perform: props.appearTrigger)
        }
    }
}
