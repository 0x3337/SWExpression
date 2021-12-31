//
//  ExpressionOperator.swift
//
//
//  Created by Mirsaid Patarov on 7/20/20.
//

import Foundation

enum Operator: String, CaseIterable {
  case add = "+"
  case subtract = "-"
  case multiply = "*"
  case divide = "/"

  var precedence: Int {
    switch self {
    case .add:
      return 1
    case .subtract:
      return 1
    case .multiply:
      return 2
    case .divide:
      return 2
    }
  }
}
