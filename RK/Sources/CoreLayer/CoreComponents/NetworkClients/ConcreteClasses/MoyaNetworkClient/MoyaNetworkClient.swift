//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Moya
import Combine
import Alamofire
import Foundation

class MoyaNetworkClient: NetworkClient {

    private let provider: MoyaProvider<MultiTarget>

    /// Сетевой клиент на основе Moya
    /// Добавляется отладка через DEBUG
    /// Заголовки http запросов
    /// Кастомный менеджер Alamofire
    ///
    /// - Parameters:
    /// - Returns: observable progress
    init() {
        var plugins = [PluginType]()
        #if DEBUG
        plugins.append(NetworkLoggerPlugin(verbose: true))
        #endif

        self.provider = MoyaProvider<MultiTarget>(endpointClosure: { (target: MultiTarget) -> Endpoint in
            let defaultEndpoint = MoyaProvider.defaultEndpointMapping(for: target)
            return defaultEndpoint
        }, plugins: plugins)
    }

    // Выполнение сетевого запроса
    // Пропускаем только успешные запросы 200-299
    func request(_ token: MultiTarget) -> AnyPublisher<Data, URLError> {
        guard let urlRequest = try? provider.endpoint(token).urlRequest() else {
            return Fail(error: URLError(.badURL))
                .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .tryMap { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    return element.data
                }
                .mapError { error in
                    guard let error = error as? URLError else {
                        return URLError(.unknown)
                    }
                    return error
                }
                .eraseToAnyPublisher()
    }
}
