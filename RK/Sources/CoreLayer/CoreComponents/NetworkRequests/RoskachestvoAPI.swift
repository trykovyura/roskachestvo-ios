//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Foundation

enum RoskachestvoAPI {
    case searchProduct(code: String)
    case product(id: Int)
    case products
    case categories
    case researches
    case research(id: String)
    case categoriesWithResearches
}

extension RoskachestvoAPI: APIRequest {

    var headers: [String: String]? {
        nil
    }

    var baseURL: URL {
        URL(string: "https://rskrf.ru/api")!
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .searchProduct(let code):
            return "/getproduct/\(code)"
        case .product(let id):
            return "/product/\(id)"
        case .products:
            return "/getproducts"
        case .categories:
            return "/getcategories"
        case .researches:
            return "/getresearches"
        case .research(let id):
            return "/research/\(id)"
        case .categoriesWithResearches:
            return "/researches"
        }

    }

    /// The HTTP method used in the request.
    var method: HTTPMethod {
        .get
    }
}
