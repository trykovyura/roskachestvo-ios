//
// Created by Юрий Трыков on 2019-02-01.
// Copyright (c) 2019 trykov. All rights reserved.
//

import Moya

enum RoskachestvoAPI {
    case searchProduct(code: String)
    case product(id: Int)
    case getProducts
    case getCategories
    case getResearches
    case research(id: Int)
    case researches
}

extension RoskachestvoAPI: TargetType {

    var headers: [String: String]? {
        return nil
    }

    var baseURL: URL {
        return URL(string: "https://roskachestvo.gov.ru/api")!
    }

    /// The path to be appended to `baseURL` to form the full `URL`.
    var path: String {
        switch self {
        case .searchProduct(let code):
            return "/getproduct/\(code)"
        case .product(let id):
            return "/product/\(id)"
        case .getProducts:
            return "/getproducts"
        case .getCategories:
            return "/getcategories"
        case .getResearches:
            return "/getresearches"
        case .research(let id):
            return "/research/\(id)"
        case .researches:
            return "/researches"
        }

    }

    /// The HTTP method used in the request.
    var method: Moya.Method {
        return .get
    }

    /// Provides stub data for use in testing.
    var sampleData: Data {
        return Data()
    }

    /// The type of HTTP task to be performed.
    var task: Task {
        return .requestPlain
    }

    /// Whether or not to perform Alamofire validation. Defaults to `false`.
    var validate: Bool {
        return false
    }
}
