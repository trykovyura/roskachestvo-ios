//
// Created by Юрий Трыков on 27.05.2020.
//

import Combine
import Foundation

class MiddlewaresCreator {
    var categoriesWithResearches: AnyCancellable?

    func categoryMiddleware(api: ResearchNetworkServiceType) -> Store<AppState>.Middleware<AppState> {
        return { [unowned self] state, action, dispatch in
            switch action {
            case Actions.CategoryAction.start:
                self.categoriesWithResearches = api.categoriesWithResearches()
                        .receive(on: DispatchQueue.main)
                        .map { $0.compactMap(CategoriesVO.init)}
                        .print()
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
}
