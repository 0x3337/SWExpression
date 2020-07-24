//
//  ExpressionTreeTests.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest
@testable import ExpressionTree

final class ExpressionTreeTests: XCTestCase {
  func testExample() {
    XCTAssertEqual(ExpressionTree("2+3").calculate(), 5)
    XCTAssertEqual(ExpressionTree("3-4").calculate(), -1)
    XCTAssertEqual(ExpressionTree("4*5").calculate(), 20)
    XCTAssertEqual(ExpressionTree("6/3").calculate(), 2)
  }

  func testMinus() {
    XCTAssertEqual(ExpressionTree("-2+3").calculate(), 1)
    XCTAssertEqual(ExpressionTree("-3-4").calculate(), -7)

    XCTAssertEqual(ExpressionTree("-4*5").calculate(), -20)
    XCTAssertEqual(ExpressionTree("4*-5").calculate(), -20)

    XCTAssertEqual(ExpressionTree("-6/3").calculate(), -2)
    XCTAssertEqual(ExpressionTree("6/-3").calculate(), -2)
  }

  static var allTests = [
    ("testExample", testExample),
    ("testMinus", testMinus),
  ]
}
