//
// Created by Юрий Трыков on 05.07.2020.
//

import Foundation

struct ImageVO: Hashable {
    let src: String?
    let width: Int?
    let height: Int?
    let size: Int?
}
extension ImageVO {
    init(dto: ImageDTO) {
        self.src = dto.src
        self.width = dto.width
        self.height = dto.height
        self.size = dto.size
    }
}
