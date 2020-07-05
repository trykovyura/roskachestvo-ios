//
//  ResearchFeedResearchFeedInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 09/03/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift
import Combine

class ResearchFeedInteractor: ResearchFeedInteractorInput {

    weak var output: ResearchFeedInteractorOutput!

    let researchNetworkService: ResearchNetworkServiceType
    var researchesRequest: AnyCancellable?
    var researchesByCategoriesRequest: AnyCancellable?

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
        researchesRequest = researchNetworkService.researches()
        .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:()
                    case .failure:
                        self?.output.didFailObtainResearches()
                    }
                }, receiveValue: { [weak self] response in
                    self?.output.didObtainResearches(response)
                })
    }

    func researchesByCategory(categoryId: Int) {
        researchesByCategoriesRequest = researchNetworkService.categoriesWithResearches()
                .map { categories in
                    let categories = categories.filter { (object: CategoriesDTO) -> Bool in
                        object.id == categoryId
                    }
                    return categories.first?.researches ?? []
                }
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:()
                    case .failure:
                        self?.output.didFailObtainResearches()
                    }
                }, receiveValue: { [weak self] response in
                    self?.output.didObtainResearches(response)
                })
    }
}
