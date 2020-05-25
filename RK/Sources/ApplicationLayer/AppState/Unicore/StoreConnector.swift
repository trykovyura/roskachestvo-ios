//
// Created by Юрий Трыков on 17.05.2020.
//

import SwiftUI

struct StoreConnector<State, V: View>: View {
    @EnvironmentObject var store: Store<State>
    let content: (State, @escaping (Action) -> Void) -> V

    var body: V {
        content(store.state, store.dispatch(action:))
    }
}
