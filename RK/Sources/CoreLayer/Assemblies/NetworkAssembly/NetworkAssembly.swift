//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Swinject

class NetworkAssembly: Assembly {

    func assemble(container: Container) {
        container.register(NetworkClient.self) { _ in
            return URLSessionNetworkClient()
        }.inObjectScope(.container)
    }
}
