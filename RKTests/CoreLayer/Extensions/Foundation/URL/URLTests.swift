//
// Created by Юрий Трыков on 28.09.2020.
//

import XCTest
@testable import RK

final class URLTests: XCTestCase {

    func test_apple() {
        // Given
        let image = "/goods/kefir-massovaya-dolya-zhira-2-5--7056b4/"
        // When
        let successURL = image.imageURL()
        // Then
        guard let imageURL = successURL else {
            XCTFail()
            return
        }
        XCTAssertNotNil(imageURL.host)
        XCTAssertTrue(imageURL.absoluteString.starts(with: Constants.imageHost))
        XCTAssertTrue(imageURL.pathComponents.contains("goods"))
        XCTAssertTrue(imageURL.pathComponents.contains("kefir-massovaya-dolya-zhira-2-5--7056b4"))
    }
}
