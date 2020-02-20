//
//  ResearchFeedResearchFeedInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift

class ResearchFeedInteractor: ResearchFeedInteractorInput {

    weak var output: ResearchFeedInteractorOutput!

    let researchNetworkService: ResearchNetworkServiceType

    init(researchNetworkService: ResearchNetworkServiceType) {
        self.researchNetworkService = researchNetworkService
    }

    let disposeBag = DisposeBag()

    func researches(with categoryId: String?) {
        guard let categoryId = categoryId, let catId = Int(categoryId) else {
            researches()
            return
        }
        researchesByCategory(categoryId: catId)
    }

    func researches() {
        researchNetworkService.researches()
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] response in
                            self?.output.didObtainResearches(response)
                        }, onError: { [weak self] _ in
                    self?.output.didFailObtainResearches()
                })
                .disposed(by: disposeBag)
    }

    func researchesByCategory(categoryId: Int) {
        researchNetworkService.categoriesWithResearches()
                .flatMap { categories -> Observable<[ResearchesDTO]> in
                    let categories = categories.filter { (object: CategoriesDTO) -> Bool in
                        object.id == categoryId
                    }
                    return Observable.just(categories.first?.researches ?? [])
                }
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] response in
                            self?.output.didObtainResearches(response)
                        }, onError: { [weak self] _ in
                    self?.output.didFailObtainResearches()
                })
                .disposed(by: disposeBag)
    }
}
