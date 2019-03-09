//
//  MainFeedMainFeedInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 10/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift

class MainFeedInteractor: MainFeedInteractorInput {

    weak var output: MainFeedInteractorOutput!

    let researchNetworkService: ResearchNetworkServiceType

    init(researchNetworkService: ResearchNetworkServiceType) {
        self.researchNetworkService = researchNetworkService
    }

    let disposeBag = DisposeBag()

    func categoriesWithResearches() {
        researchNetworkService.categoriesWithResearches()
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] response in
                            self?.output.didObtainCategoriesWithResearches(response)
                        }, onError: { [weak self] error in
                            print(error)
                            self?.output.didFailObtainCategoriesWithResearches()
                        })
                .disposed(by: disposeBag)
    }
}
