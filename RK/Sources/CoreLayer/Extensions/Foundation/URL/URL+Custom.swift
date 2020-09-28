//
// Created by Юрий Трыков on 28.09.2020.
//

import Foundation

extension URL {
    func applyHost(host: String = Constants.imageHost) -> URL? {
        var components = URLComponents(url: self, resolvingAgainstBaseURL: false)
        components?.host = host
        return components?.url
    }
}
