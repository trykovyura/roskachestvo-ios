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
                        .cornerRadius(4)
            }
                    .onAppear(perform: props.appearTrigger)
        }
    }
}
struct CategoryCellView: View {
    let viewModel: CategoryCellViewModel
    var body: some View {
        VStack {
            ImageView(image: viewModel.image, loading: viewModel.loading)
            TextView(name: viewModel.name, loading: viewModel.loading)
            NavigationLink(destination: ResearchFeedView(categoryId: viewModel.id)) {
                EmptyView()
            }
        }
        .background(Color.white)
        .frame(height: 135)
    }
}
struct ImageView: View {
    let image: Image
    let loading: Bool
    var body: some View {
        image
                .resizable()
                .skeleton(with: loading)
                .shape(type: .rectangle)
                .appearance(type: .gradient())
                .animation(type: .none)
                .frame(height: 95)
                .frame(minWidth: 0, maxWidth: .infinity)
    }
}
struct TextView: View {
    let name: String
    let loading: Bool

    var body: some View {
        Text(name)
                .font(.system(size: 17.0))
                .skeleton(with: loading)
                .shape(type: .capsule)
                .multiline(lines: 3, scales: [1: 0.5, 2: 0.25])
                .appearance(type: .gradient())
                .animation(type: .linear())
    }
}
