//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Combine
import Moya

protocol NetworkClient {
    func request(_ token: MultiTarget) -> AnyPublisher<Data, URLError>
}
