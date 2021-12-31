//
//  SWExpressionTests.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest
@testable import SWExpression

final class SWExpressionTests: XCTestCase {
  func testExample() {
    XCTAssertEqual(SWExpression(format: "2 + 3").calculate(), 5)
    XCTAssertEqual(SWExpression(format: "3 - 4").calculate(), -1)
    XCTAssertEqual(SWExpression(format: "4 * 5").calculate(), 20)
    XCTAssertEqual(SWExpression(format: "6 / 3").calculate(), 2)
  }

  func testMinus() {
    XCTAssertEqual(SWExpression(format: "-2 + 3").calculate(), 1)
    XCTAssertEqual(SWExpression(format: "-3 - 4").calculate(), -7)

    XCTAssertEqual(SWExpression(format: "-4 * 5").calculate(), -20)
    XCTAssertEqual(SWExpression(format: "4 * -5").calculate(), -20)

    XCTAssertEqual(SWExpression(format: "-6 / 3").calculate(), -2)
    XCTAssertEqual(SWExpression(format: "6 / -3").calculate(), -2)
  }

  static var allTests = [
    ("testExample", testExample),
    ("testMinus", testMinus),
  ]
}
