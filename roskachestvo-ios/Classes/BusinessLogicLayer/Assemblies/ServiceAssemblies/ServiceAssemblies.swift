//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Swinject

class ServiceAssemblies: Assembly {

    func assemble(container: Container) {
        registerNetworkService(container: container)
    }

    private func registerNetworkService(container: Container) {
        container.register(ResearchNetworkServiceType.self) { _ in
            ResearchNetworkService()
        }.inObjectScope(.transient)
    }
}
