import XCTest
@testable import SFMongo

class SFMongoTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        XCTAssertEqual(SFMongo().text, "Hello, World!")
    }


    static var allTests : [(String, (SFMongoTests) -> () throws -> Void)] {
        return [
            ("testExample", testExample),
        ]
    }
}
