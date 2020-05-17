//
// Created by Юрий Трыков on 17.05.2020.
//

struct AppState: Reducable {
}
extension Reduce {

    static let state = AppState.reduce.with { _, _ in
        AppState()
    }
}
