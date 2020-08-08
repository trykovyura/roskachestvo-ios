//
// Created by Юрий Трыков on 27.05.2020.
//

import Combine
import Foundation

class MiddlewaresCreator {
    var categoriesWithResearches: AnyCancellable?
    var research: AnyCancellable?
    var product: AnyCancellable?

    func categoryMiddleware(api: ResearchNetworkServiceType) -> Store<AppState>.Middleware<AppState> {
        return { [unowned self] state, action, dispatch in
            switch action {
            case Actions.CategoryAction.start:
                self.categoriesWithResearches = api.categoriesWithResearches()
                        .map { $0.compactMap(CategoriesVO.init)}
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .finished:()
                            case .failure(let error): dispatch(Actions.CategoryAction.error(error))
                            }
                        }, receiveValue: { response in
                            dispatch(Actions.CategoryAction.success(response))
                        })
            default:
                break
            }
        }
    }

    func researchDetailsMiddleware(api: ResearchNetworkServiceType) -> Store<AppState>.Middleware<AppState> {
        return { [unowned self] state, action, dispatch in
            switch action {
            case Actions.ResearchFeedAction.start(let researchId):
                self.research = api.research(id: researchId)
                        .map { ResearchVO(id: researchId, dto: $0) }
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .finished:()
                            case .failure(let error): dispatch(Actions.ResearchFeedAction.error(error))
                            }
                        }, receiveValue: { response in
                            dispatch(Actions.ResearchFeedAction.success(response))
                        })
            default:
                break
            }
        }
    }

    func productMiddleware(api: ResearchNetworkServiceType) -> Store<AppState>.Middleware<AppState> {
        return { [unowned self] state, action, dispatch in
            switch action {
            case Actions.ProductDetailsAction.start(let productId):
                self.product = api.product(id: productId)
                        .map { ProductVO(id: productId, dto: $0) }
                        .receive(on: DispatchQueue.main)
                        .sink(receiveCompletion: { completion in
                            switch completion {
                            case .finished:()
                            case .failure(let error): dispatch(Actions.ProductDetailsAction.error(error))
                            }
                        }, receiveValue: { product in
                            dispatch(Actions.ProductDetailsAction.success(product))
                        })
            default:
                break
            }
        }

    }
}
