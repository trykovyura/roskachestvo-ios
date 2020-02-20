//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Moya
import RxSwift
import Result
import Alamofire

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
    // Даем 1 попытка для retry
    // Пропускаем только успешные запросы 200-299
    func request(_ token: MultiTarget) -> Observable<Response> {
        return provider.rx.request(token)
                .retry(1)
                .filterSuccessfulStatusCodes()
                .asObservable()
    }
}
