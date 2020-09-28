//
// Created by Юрий Трыков on 28.09.2020.
//

import XCTest
@testable import RK

final class URLTests: XCTestCase {

    func test_apple() {
        // Given
        let image = "/goods/kefir-massovaya-dolya-zhira-2-5--7056b4/"
        let url = URL(string: image)
        // When
        let successURL = url?.apply(host: Constants.imageHost)
        // Then
        XCTAssertNotNil(successURL?.host)
        XCTAssertEqual(successURL?.host, Constants.imageHost)
        guard let pathComponents = successURL?.pathComponents else {
            XCTFail()
            return
        }
        XCTAssertTrue(pathComponents.contains("goods"))
        XCTAssertTrue(pathComponents.contains("kefir-massovaya-dolya-zhira-2-5--7056b4"))
    }
}
