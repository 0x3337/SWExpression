//
//  SWExpressionTests.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest
@testable import SWExpression

final class SWExpressionTests: XCTestCase {
  func testAddition() {
    XCTAssertEqual(SWExpression(format: "2 + 3").evaluate(), 5)
    XCTAssertEqual(SWExpression(format: "2 + +3").evaluate(), 5)
    XCTAssertEqual(SWExpression(format: "+2 + 3").evaluate(), 5)
    XCTAssertEqual(SWExpression(format: "+2 + +3").evaluate(), 5)
  }

  func testSubtraction() {
    XCTAssertEqual(SWExpression(format: "3 - 4").evaluate(), -1)
    XCTAssertEqual(SWExpression(format: "3 - -4").evaluate(), 7)
    XCTAssertEqual(SWExpression(format: "-3 - 4").evaluate(), -7)
    XCTAssertEqual(SWExpression(format: "-3 - -4").evaluate(), 1)
  }

  func testMultiplication() {
    XCTAssertEqual(SWExpression(format: "4 * 5").evaluate(), 20)
    XCTAssertEqual(SWExpression(format: "4 * +5").evaluate(), 20)
    XCTAssertEqual(SWExpression(format: "+4 * 5").evaluate(), 20)
    XCTAssertEqual(SWExpression(format: "+4 * +5").evaluate(), 20)
  }

  func testDivision() {
    XCTAssertEqual(SWExpression(format: "6 / 3").evaluate(), 2)
    XCTAssertEqual(SWExpression(format: "6 / -3").evaluate(), -2)
    XCTAssertEqual(SWExpression(format: "-6 / 3").evaluate(), -2)
    XCTAssertEqual(SWExpression(format: "-6 / -3").evaluate(), 2)
  }

  func testBracket() {
    XCTAssertEqual(SWExpression(format: "(1 + 2) * (3 + 4)").evaluate(), 21)
    XCTAssertEqual(SWExpression(format: "(1 - 2) * (3 - 4)").evaluate(), 1)
  }

  func testFloat() {
    XCTAssertEqual(SWExpression(format: "1.25 * 2 / 4 + 1").evaluate(), 1.625)
  }

  func testMathExmaple() {
    XCTAssertEqual(SWExpression(format: "3337 + 27 * 1991 / 5.5").evaluate(), 13111)
  }

  static var allTests = [
    ("testExample", testAddition),
    ("testMinus", testSubtraction),
    ("testMultiplication", testMultiplication),
    ("testDivision", testDivision),
    ("testBracket", testBracket),
    ("testFloat", testFloat),
    ("testMathExmaple", testMathExmaple)
  ]
}
