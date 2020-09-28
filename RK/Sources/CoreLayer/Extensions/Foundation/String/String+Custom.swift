//
// Created by Юрий Трыков on 28.09.2020.
//

import Foundation

extension String {
    func asURL() -> URL? {
        URL(string: self)
    }
}