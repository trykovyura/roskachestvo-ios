//
//  MainFeedViewScene.swift
//  RK
//
//  Created by Трыков Юрий on 10.05.2020.
//

import SwiftUI

//struct MainFeedViewScene {
//    typealias UIViewControllerType = MainFeedViewController
//
//    func makeUIViewController(context: Context) -> MainFeedViewController {
//        R.storyboard.mainFeed.instantiateInitialViewController()!
//    }
//
//    func updateUIViewController(_ uiViewController: MainFeedViewController, context: Context) {
//    }
//}
import RxSwift
import struct Kingfisher.KFImage

struct MainFeedViewScene: View {
    let researchNetworkService = MainAssembler.sharedInstance.resolve(ResearchNetworkServiceType.self)
    @State var state: [CategoriesDTO]
    let disposeBag = DisposeBag()
    var body: some View {
        NavigationView {
            List {
                ForEach(state) { category in
                    ForEach(category.researches!) { research in
                        ResearchCellView(viewModel: ResearchCellViewModel(model: research))
                    }
                }
            }
            .onAppear(perform: fetch)
        }
    }
    private func fetch() {
        researchNetworkService.categoriesWithResearches()
                       .observeOn(MainScheduler.instance)
                       .subscribe(
                               onNext: { response in
                                   self.state = response
                               }, onError: { error in
                                   print(error)
                               })
                       .disposed(by: disposeBag)
    }
}
struct ResearchCellView: View {
    @State var viewModel: ResearchCellViewModel
    var body: some View {
        VStack {
            KFImage(URL(string: viewModel.image))
            .onFailure(perform: {error in
            })
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
