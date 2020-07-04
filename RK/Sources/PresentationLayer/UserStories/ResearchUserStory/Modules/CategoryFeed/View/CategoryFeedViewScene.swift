//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI
import Combine
import struct Kingfisher.KFImage
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
                CategoryCellView(viewModel: CategoryCellViewModel(vo: category, loading: loading))
                        .navigationBarTitle(R.string.localizable.categoryTitle())
                        .font(.largeTitle)
            }
                    .onAppear(perform: props.appearTrigger)
        }
    }
}
struct CategoryCellView: View {
    let viewModel: CategoryCellViewModel
    var body: some View {
        VStack {
            viewModel.image
                    .resizable()
                    .skeleton(with: viewModel.loading)
                    .shape(type: .rectangle)
                    .appearance(type: .gradient())
                    .animation(type: .none)
                    .frame(height: 95)
                    .frame(minWidth: 0, maxWidth: .infinity)
            Text(viewModel.name)
                .font(.system(size: 17.0))
                    .skeleton(with: viewModel.loading)
                    .shape(type: .capsule)
                    .multiline(lines: 3, scales: [1: 0.5, 2: 0.25])
                    .appearance(type: .gradient())
                    .animation(type: .linear())
        }
        .background(Color.white)
        .frame(height: 135)
    }
}
