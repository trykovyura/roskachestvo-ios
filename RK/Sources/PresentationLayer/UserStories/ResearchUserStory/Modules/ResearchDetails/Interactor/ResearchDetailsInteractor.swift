//
//  ResearchDetailsResearchDetailsInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift
import Combine

class ResearchDetailsInteractor: ResearchDetailsInteractorInput {

    weak var output: ResearchDetailsInteractorOutput!

    var researchNetworkService: ResearchNetworkServiceType!

    let disposeBag = DisposeBag()
    var research: AnyCancellable?

    func researchDetails(with researchId: String) {
        self.research = researchNetworkService.research(id: researchId)
                .print()
                .receive(on: DispatchQueue.main)
                .sink(receiveCompletion: { [weak self] completion in
                    switch completion {
                    case .finished:()
                    case .failure: self?.output.didFailObtainResearchDetails()
                    }
                }, receiveValue: { [weak self] response in
                    self?.output.didObtainResearchDetails(research: response)
                })
    }
}
