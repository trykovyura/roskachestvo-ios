//
//  ResearchDetailsResearchDetailsInteractor.swift
//  roskachestvo-ios
//
//  Created by trykov on 17/02/2019.
//  Copyright © 2019 trykov.ru. All rights reserved.
//

import RxSwift

class ResearchDetailsInteractor: ResearchDetailsInteractorInput {

    weak var output: ResearchDetailsInteractorOutput!

    var researchNetworkService: ResearchNetworkServiceType!

    let disposeBag = DisposeBag()

    func researchDetails(with researchId: String) {
        researchNetworkService.research(id: researchId)
                .observeOn(MainScheduler.instance)
                .subscribe(
                        onNext: { [weak self] research in
                            self?.output.didObtainResearchDetails(research: research)
                        }, onError: { [weak self] error in
                            print(error)
                            self?.output.didFailObtainResearchDetails()
                        })
                .disposed(by: disposeBag)
    }
}
