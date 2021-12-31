//
//  LinuxMain.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest
import SWExpression

var tests = [XCTestCaseEntry]()
tests += SWExpressionTests.allTests()
XCTMain(tests)
