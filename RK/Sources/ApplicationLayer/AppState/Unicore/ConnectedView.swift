//
// Created by Юрий Трыков on 17.05.2020.
//

import SwiftUI

protocol ConnectedView: View {
    associatedtype State
    associatedtype Props
    associatedtype MainView: View

    func map(state: State, dispatch: @escaping (Action) -> Void) -> Props
    static func body(props: Props) -> MainView
}

extension ConnectedView {
    func render(state: State, dispatch: @escaping (Action) -> Void) -> MainView {
        let props = map(state: state, dispatch: dispatch)
        return Self.body(props: props)
    }

    var body: StoreConnector<State, MainView> {
        return StoreConnector(content: render)
    }
}
