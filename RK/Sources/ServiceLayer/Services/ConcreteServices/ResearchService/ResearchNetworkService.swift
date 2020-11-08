//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Combine
import Foundation

protocol ResearchNetworkServiceType: class {
    func searchProduct(code: String) -> AnyPublisher<[SearchProductDTO], Error>
    func product(id: Int) -> AnyPublisher<ProductDTO, Error>
    func products() -> AnyPublisher<[ProductsDTO], Error>
    func categories() -> AnyPublisher<[CategoryDTO], Error>
    func categoriesWithResearches() -> AnyPublisher<[CategoriesDTO], Error>
    func researches() -> AnyPublisher<[ResearchesDTO], Error>
    func research(id: String) -> AnyPublisher<ResearchDTO, Error>
}

class ResearchNetworkService: ResearchNetworkServiceType {

    private let networkClient: NetworkClient

    // MARK: - Init

    init(networkClient: NetworkClient) {
        self.networkClient = networkClient
    }

    func searchProduct(code: String) -> AnyPublisher<[SearchProductDTO], Error> {
        return networkClient.request(RoskachestvoAPI.searchProduct(code: code))
                .decode(type: [SearchProductDTO].self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func product(id: Int) -> AnyPublisher<ProductDTO, Error> {
        return networkClient.request(RoskachestvoAPI.product(id: id))
                .decode(type: ProductDTO.self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func products() -> AnyPublisher<[ProductsDTO], Error> {
        return networkClient.request(RoskachestvoAPI.products)
                .decode(type: [ProductsDTO].self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func categories() -> AnyPublisher<[CategoryDTO], Error> {
        return networkClient.request(RoskachestvoAPI.categories)
                .decode(type: [CategoryDTO].self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func categoriesWithResearches() -> AnyPublisher<[CategoriesDTO], Error> {
        return networkClient.request(RoskachestvoAPI.categoriesWithResearches)
                .decode(type: [CategoriesDTO].self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func researches() -> AnyPublisher<[ResearchesDTO], Error> {
        return networkClient.request(RoskachestvoAPI.researches)
                .decode(type: [ResearchesDTO].self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }

    func research(id: String) -> AnyPublisher<ResearchDTO, Error> {
        return networkClient.request(RoskachestvoAPI.research(id: id))
                .decode(type: ResearchDTO.self, decoder: JSONDecoder())
                .print()
                .eraseToAnyPublisher()
    }
}
