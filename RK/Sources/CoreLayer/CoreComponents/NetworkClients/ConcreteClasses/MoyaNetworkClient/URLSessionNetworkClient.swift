//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Combine
import Foundation

class URLSessionNetworkClient: NetworkClient {

    // Выполнение сетевого запроса
    // Пропускаем только успешные запросы 200-299
    func request<T: APIRequest>(_ token: T) -> AnyPublisher<Data, URLError> {
        guard let urlRequest = try? buildURLRequest(for: token) else {
            return Fail(error: URLError(.badURL))
                    .eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
                .print()
                .tryMap { element -> Data in
                    guard let httpResponse = element.response as? HTTPURLResponse,
                          (200...299).contains(httpResponse.statusCode) else {
                        throw URLError(.badServerResponse)
                    }
                    print(String(data: element.data, encoding: String.Encoding.utf8) ?? "No data")
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

    func buildURLRequest<T: APIRequest>(for request: T) throws -> URLRequest {
        var urlRequest = URLRequest(url: request.baseURL.appendingPathComponent(request.path),
                cachePolicy: .reloadIgnoringLocalAndRemoteCacheData,
                timeoutInterval: 100)
        urlRequest.httpMethod = request.method.rawValue

        request.headers?.forEach {
            urlRequest.addValue($0.value, forHTTPHeaderField: $0.key)
        }
        return urlRequest
    }
}
