import XCTest
import Combine
@testable import cloud_config_swift

final class cloud_config_swiftTests: XCTestCase {

  var subs = [AnyCancellable]()

  func testEndToEnd() throws {

    try CloudConfig.shared.setup(
      id: "1",
      version: "1.0.0",
      key: "193ffa9148msh52aeb2d9a7a0fb1p10e6a1jsndd8891d8b785",
      default: nil
    )

    let expectation = expectation(description: "config refresh")

    CloudConfig.shared.config
      .sink { config in
        XCTAssertNotNil(config)
        expectation.fulfill()
      }
      .store(in: &subs)

    wait(for: [expectation], timeout: 10.0)
  }
}

