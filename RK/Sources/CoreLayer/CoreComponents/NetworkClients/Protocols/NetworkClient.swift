//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Combine
import Foundation

protocol NetworkClient {
    func request<T: APIRequest>(_ token: T) -> AnyPublisher<Data, URLError>
}

// This is the `APIRequest` protocol you may implement other classes can conform
protocol APIRequest {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var headers: [String: String]? { get }
}

// This defines the type of HTTP method used to perform the request
enum HTTPMethod: String {
    case post = "POST"
    case put = "PUT"
    case get = "GET"
    case delete = "DELETE"
    case patch = "PATCH"
}
