//
//  OperandNode.swift
//
//
//  Created by Mirsaid Patarov on 7/21/20.
//

import Foundation

class OperandNode: Node {
  var value: NSDecimalNumber!

  init(_ value: NSDecimalNumber) {
    self.value = value
  }
}
