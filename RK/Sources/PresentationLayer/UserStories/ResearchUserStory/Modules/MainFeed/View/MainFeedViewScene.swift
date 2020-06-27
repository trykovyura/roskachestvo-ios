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

struct MainFeedViewScene: ConnectedView {
    struct Props {
        let categories: [CategoriesDTO]
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let categories = [CategoriesDTO]()//state.categories
        let appearTrigger = { dispatch(Actions.CategoryAction.start) }
        return Props(categories: categories, appearTrigger: appearTrigger)
    }

    static func body(props: Props) -> some View {
        NavigationView {
            List {
                ForEach(props.categories) { category in
                    ForEach(category.researches!) { research in
                        ResearchCellView(viewModel: ResearchCellViewModel(model: research))
                    }
                }
                        .skeleton(with: props.categories.isEmpty)
                        .shape(type: .rectangle)
                        .multiline(lines: 20)
                        .animation(type: .linear())
            }
                    .onAppear(perform: props.appearTrigger)
        }
    }
}
struct ResearchCellView: View {
    @State var viewModel: ResearchCellViewModel
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.image))
                .resizable()
                .frame(width: UIScreen.screenSize.width * 0.95, alignment: .leading)
            Text(viewModel.name)
                .font(.system(size: 17.0))
                .frame(width: UIScreen.screenSize.width * 0.95, alignment: .leading)
        }
        .background(Color.white)
        .frame(width: UIScreen.screenSize.width * 0.95, height: UIScreen.screenHeight/5 )
        .navigationBarTitle(R.string.localizable.categoryTitle())
        .font(.largeTitle)
    }
}

extension UIScreen {
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
