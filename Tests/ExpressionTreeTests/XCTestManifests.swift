//
//  XCTestManifests.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
  return [
    testCase(ExpressionTreeTests.allTests),
  ]
}
#endif
