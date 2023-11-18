//
//  SWExpression.swift
//
//
//  Created by Mirsaid Patarov on 7/20/20.
//

import Foundation

extension SWExpression {
  enum Operator: String {
    case add = "+"
    case subtract = "-"
    case multiply = "*"
    case divide = "/"
  }
}

public class SWExpression {
  private let precedences: [Character: Int] = [
    "+": 1,
    "-": 1,
    "*": 2,
    "/": 2,
  ]

  public let expressionFormat: String

  public init(format expressionFormat: String) {
    self.expressionFormat = expressionFormat.filter { !$0.isWhitespace }
  }

  public func evaluate() -> Decimal {
    let postfix = toPostfix(infix: expressionFormat)
    var stack = [Decimal]()

    for value in postfix {
      guard let op = Operator(rawValue: value) else {
        stack.append(Decimal(string: value)!)
        continue
      }

      let right = stack.popLast()!
      let left = stack.popLast()!

      switch op {
      case .add:
        stack.append(left + right)
      case .subtract:
        stack.append(left - right)
      case .multiply:
        stack.append(left * right)
      case .divide:
        stack.append(left / right)
      }
    }

    return stack.popLast() ?? 0
  }
}

private extension SWExpression {
  func toPostfix(infix: String) -> [String] {
    var postfix = [String]()
    var stack = [Character]()

    var prevChar: Character?
    var numberPrefix: Character?

    for (_, char) in infix.enumerated() {
      switch true {
      case char.isNumberPrefix(previous: prevChar):
        numberPrefix = char
      case char.isPartOfNumber:
        var value = {
          let defaultValue = numberPrefix == nil ? "" : "\(numberPrefix!)"
          numberPrefix = nil

          if let prevChar = prevChar, prevChar.isPartOfNumber {
            return postfix.popLast() ?? defaultValue
          }

          return defaultValue
        }()

        value.append(char)
        postfix.append(value)
      case char == "(":
        stack.append(char)
      case char == ")":
        while !stack.isEmpty && stack.last != "(" {
          postfix.append(String(stack.popLast()!))
        }

        let _ = stack.popLast()
      default:
        while !stack.isEmpty && precedence(for: stack.last) >= precedence(for: char) {
          postfix.append(String(stack.popLast()!))
        }

        stack.append(char)
      }

      prevChar = char
    }

    while !stack.isEmpty {
      postfix.append(String(stack.popLast()!))
    }

    return postfix
  }

  func precedence(for char: Character?) -> Int {
    guard let char = char else {
      return 0
    }

    return precedences[char] ?? 0
  }
}
