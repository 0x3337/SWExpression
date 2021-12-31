//
//  OperatorNode.swift
//
//
//  Created by Mirsaid Patarov on 7/21/20.
//

import Foundation

class OperatorNode: Node {
  let `operator`: Operator

  var left: Node!
  var right: Node!

  var precedence: Int {
    return `operator`.precedence
  }

  init(_ operator: Operator) {
    self.operator = `operator`
  }
}
