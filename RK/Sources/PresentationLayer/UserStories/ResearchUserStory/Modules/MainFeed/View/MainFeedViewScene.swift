//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI
import RxSwift
import struct Kingfisher.KFImage

struct MainFeedViewScene: ConnectedView {
    let disposeBag = DisposeBag()
    let researchNetworkService = MainAssembler.sharedInstance.resolve(ResearchNetworkServiceType.self)

    struct Props {
        let categories: [CategoriesDTO]
        let appearTrigger: () -> Void
    }

    func map(state: AppState, dispatch: @escaping (Action) -> Void) -> Props {
        let categories = state.categories
        let appearTrigger = { [researchNetworkService, disposeBag] in
            researchNetworkService.categoriesWithResearches()
                    .observeOn(MainScheduler.instance)
                    .subscribe(
                            onNext: { response in
                                dispatch(Actions.ToggleCategories(categories: response))
                            }, onError: { error in
                        print(error)
                    })
                    .disposed(by: disposeBag) }
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
            }.onAppear(perform: props.appearTrigger)
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
