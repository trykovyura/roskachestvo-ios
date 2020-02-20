//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import RxSwift
import Moya

protocol ResearchNetworkServiceType: class {
    func searchProduct(code: String) -> Observable<[SearchProductDTO]>
    func product(id: String) -> Observable<ProductDTO>
    func products() -> Observable<[ProductsDTO]>
    func categories() -> Observable<[CategoryDTO]>
    func categoriesWithResearches() -> Observable<[CategoriesDTO]>
    func researches() -> Observable<[ResearchesDTO]>
    func research(id: String) -> Observable<ResearchDTO>
}

class ResearchNetworkService: ResearchNetworkServiceType {

    private let networkClient: NetworkClient

    // MARK: - Init

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func searchProduct(code: String) -> Observable<[SearchProductDTO]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.searchProduct(code: code)))
                .observeOn(RSKScheduler.background)
                .map([SearchProductDTO].self)
    }

    func product(id: String) -> Observable<ProductDTO> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.product(id: id)))
                .observeOn(RSKScheduler.background)
                .map(ProductDTO.self)
    }

    func products() -> Observable<[ProductsDTO]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.products))
                .observeOn(RSKScheduler.background)
                .map([ProductsDTO].self)
    }

    func categories() -> Observable<[CategoryDTO]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.categories))
                .observeOn(RSKScheduler.background)
                .map([CategoryDTO].self)
    }

    func categoriesWithResearches() -> Observable<[CategoriesDTO]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.categoriesWithResearches))
                .observeOn(RSKScheduler.background)
                .map([CategoriesDTO].self)
    }

    func researches() -> Observable<[ResearchesDTO]> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.researches))
                .observeOn(RSKScheduler.background)
                .map([ResearchesDTO].self)
    }

    func research(id: String) -> Observable<ResearchDTO> {
        return networkClient.request(MultiTarget(RoskachestvoAPI.research(id: id)))
                .observeOn(RSKScheduler.background)
                .map(ResearchDTO.self)
    }
}
