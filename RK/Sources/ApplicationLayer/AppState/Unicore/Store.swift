//
// Created by Юрий Трыков on 17.05.2020.
//

import SwiftUI
import Combine

final class Store<S>: ObservableObject {
    typealias Dispatcher = (Action) -> Void
    typealias Middleware <S> = (S, Action, @escaping Dispatcher) -> Void
    typealias Reducer = (S, Action) -> S

    @Published private(set) var state: S

    private let reducer: Reducer

    private let middlewares: [Middleware<S>]

    init(initialState: S, reducer: @escaping (S, Action) -> S, middlewares: [Middleware<S>]) {
        self.state = initialState
        self.reducer = reducer
        self.middlewares = middlewares
    }

    func dispatch(action: Action) {
        // create new state
        state = reducer(state, action)
        // and then apply middlewares
        middlewares.forEach { middleware in
            middleware(state, action, dispatch)
        }
    }
}
