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
            UITableView.appearance().separatorStyle = .none
        }
        return Props(categories: categories, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        NavigationView {
            ScrollView {
                LazyVStack {
                    ForEach(props.categories, id: \.self) { category in
                        let destination = AnyView(ResearchFeedView(categoryId: category.id ?? 0))
                        NavigationLink(destination: destination) {
                            FeedCellView(viewModel: FeedCellViewModel(vo: category, loading: false),
                                    destination: AnyView(ResearchFeedView(categoryId: category.id ?? 0)))
                                    .navigationBarTitle(R.string.localizable.categoryTitle())
                                    .font(.largeTitle)
                                    .cornerRadius(4)
                                    .shadow(radius: 4)
                                    .padding(.leading, 20)
                                    .padding(.trailing, 20)
                        }
                    }
                }
            }
            .onAppear(perform: props.appearTrigger)
        }
    }
}
