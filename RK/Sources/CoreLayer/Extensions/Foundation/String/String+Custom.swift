//
// Created by Юрий Трыков on 28.09.2020.
//

import Foundation

extension String {
    func asURL() -> URL? {
        URL(string: self)
    }

    func imageURL(with host: String = Constants.imageHost) -> URL? {
        var components = URLComponents(string: host)
        components?.path = self
        return components?.url
    }
}
