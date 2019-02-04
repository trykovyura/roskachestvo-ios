//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import RxSwift
import Moya
import Moya_ModelMapper

protocol ResearchNetworkServiceType: class {
    func searchProduct(code: String) -> Observable<[SearchProductPlainObject]>
    func product(id: String) -> Observable<ProductPlainObject>
}

class ResearchNetworkService: ResearchNetworkServiceType {

    private let networkClient: NetworkClient

    // MARK: - Init

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func searchProduct(code: String) -> Observable<[SearchProductPlainObject]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.searchProduct(code: code)))
                .observeOn(RSKScheduler.background)
                .map(to: [SearchProductPlainObject].self)
    }

    func product(id: String) -> Observable<ProductPlainObject> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.product(id: id)))
                .observeOn(RSKScheduler.background)
                .map(to: ProductPlainObject.self)
    }
}
