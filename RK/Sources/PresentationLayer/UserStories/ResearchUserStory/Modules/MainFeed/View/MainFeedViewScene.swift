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
            .navigationBarTitle(R.string.localizable.categoryTitle())
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
            Text(viewModel.name)
        KFImage(URL(string: viewModel.image))
                               .resizable()
        .clipped()
                               .aspectRatio(contentMode: .fill)
                           HStack(alignment: .firstTextBaseline, spacing: 23) {
                               Text("K 5")
                               Text("! 3")
                           }
                       }
       .frame(height: 200)
    }
}
