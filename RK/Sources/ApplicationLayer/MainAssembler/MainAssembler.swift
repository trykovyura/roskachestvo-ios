//
// Created by Юрий Трыков on 2019-02-04.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation
import Swinject

class MainAssembler {

    // MARK: - Singleton

    static let shared = MainAssembler()

    // MARK: - Variables

    private var assembler: Assembler!

    // MARK: - Functions

    /// Function loading all assemblies (starts on start application)
    func setup() {
        self.assembler = Assembler([
            ServiceAssemblies(),
            NetworkAssembly()
        ])
    }

    /// Function wraps resolving through singleton
    public func resolve<Service>(_ serviceType: Service.Type) -> Service {
        return assembler.resolver.resolve(serviceType, name: nil)!
    }
}
