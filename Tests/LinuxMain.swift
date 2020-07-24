//
//  LinuxMain.swift
//  
//
//  Created by Mirsaid Patarov on 7/23/20.
//

import XCTest

import ExpressionTree

var tests = [XCTestCaseEntry]()
tests += ExpressionTreeTests.allTests()
XCTMain(tests)
