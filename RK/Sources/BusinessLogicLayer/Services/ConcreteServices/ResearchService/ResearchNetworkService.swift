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
    func products() -> Observable<[ProductsPlainObject]>
    func categories() -> Observable<[CategoryPlainObject]>
    func categoriesWithResearches() -> Observable<[CategoriesPlainObject]>
    func researches() -> Observable<[ResearchesPlainObject]>
    func research(id: String) -> Observable<ResearchPlainObject>
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

    func products() -> Observable<[ProductsPlainObject]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.products))
                .observeOn(RSKScheduler.background)
                .map(to: [ProductsPlainObject].self)
    }

    func categories() -> Observable<[CategoryPlainObject]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.categories))
                .observeOn(RSKScheduler.background)
                .map(to: [CategoryPlainObject].self)
    }

    func categoriesWithResearches() -> Observable<[CategoriesPlainObject]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.categoriesWithResearches))
                .observeOn(RSKScheduler.background)
                .map(to: [CategoriesPlainObject].self)
    }

    func researches() -> Observable<[ResearchesPlainObject]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.researches))
                .observeOn(RSKScheduler.background)
                .map(to: [ResearchesPlainObject].self)
    }

    func research(id: String) -> Observable<ResearchPlainObject> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.research(id: id)))
                .observeOn(RSKScheduler.background)
                .map(to: ResearchPlainObject.self)
    }
}
