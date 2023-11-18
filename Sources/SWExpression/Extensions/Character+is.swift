//
//  Character+is.swift
//
//
//  Created by Mirsaid Patarov on 2023-11-18.
//

import Foundation

extension Character {
  var isPartOfNumber: Bool {
    return isNumber || self == "."
  }

  func isNumberPrefix(previous: Character?) -> Bool {
    return !(previous?.isPartOfNumber ?? false) && (self == "+" || self == "-")
  }
}
