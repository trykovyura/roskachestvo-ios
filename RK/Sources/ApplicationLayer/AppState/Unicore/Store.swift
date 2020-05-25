//
// Created by Юрий Трыков on 17.05.2020.
//

import SwiftUI
import Combine

final class Store<S>: ObservableObject {
    @Published private(set) var state: S

    private let reducer: (S, Action) -> S

    init(initialState: S, reducer: @escaping (S, Action) -> S) {
        self.state = initialState
        self.reducer = reducer
    }

    func dispatch(action: Action) {
        state = reducer(state, action)
    }
}
