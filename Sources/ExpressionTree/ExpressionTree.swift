//
//  ExpressionTree.swift
//
//
//  Created by Mirsaid Patarov on 7/20/20.
//

import Foundation

public class ExpressionTree {
  private var root: Node!
  private var operands = [Node]()
  private var operators = [OperatorNode]()



  public init(_ expression: String) {
    var str = ""
    var prevOp: Operator?

    for (i, letter) in expression.enumerated() {
      var op = Operator(rawValue: "\(letter)")

      if op == nil || ((prevOp != nil || i == 0) && op == .subtract) {
        str.append(letter)

        prevOp = nil
        op = nil
      }

      if op != nil || i == expression.count - 1 {
        let number = NSDecimalNumber(string: str)
        operands.append(OperandNode(number))

        str = ""
      }

      if let op = op, Operator.allCases.contains(op) {
        prevOp = op
        processOperator(OperatorNode(op))
      }
    }

    while !operators.isEmpty {
      let op = operators.popLast()!
      op.right = operands.popLast()!
      op.left = operands.popLast()!

      operands.append(op)
    }

    root = operands.popLast()!

    if !operands.isEmpty {
      fatalError("Syntax error")
    }
  }



  private func processOperator(_ op: OperatorNode) {
    if operators.isEmpty {
      operators.append(op)
    } else {
      var topOp = operators.last!

      if op.precedence > topOp.precedence {
        operators.append(op)
      } else {
        while !operators.isEmpty && operators.last!.precedence >= op.precedence {
          topOp = operators.popLast()!

          topOp.right = operands.popLast()!
          topOp.left = operands.popLast()!
          operands.append(topOp)
        }

        operators.append(op)
      }
    }
  }

  private func calculate(a: NSDecimalNumber, operator op: Operator, b: NSDecimalNumber) -> NSDecimalNumber {
    print(a, op.rawValue, b)
    switch op {
    case .add:
      return a.adding(b)
    case .subtract:
      return a.subtracting(b)
    case .multiply:
      return a.multiplying(by: b)
    case .divide:
      return a.dividing(by: b)
    }
  }

  private func calculate(parent: Node, child: Node? = nil) {
    guard let parent = parent as? OperatorNode else {
      return
    }

    if let l = parent.left as? OperandNode, let r = parent.right as? OperandNode {
      let value = calculate(a: l.value, operator: parent.operator, b: r.value)
      root = OperandNode(value)

      return
    }

    let child = child ?? parent
    if let op = child as? OperatorNode {
      if let l = op.left as? OperandNode, let r = op.right as? OperandNode {
        let value = calculate(a: l.value, operator: op.operator, b: r.value)

        if parent.left == child {
          parent.left = OperandNode(value)
        } else if parent.right == child {
          parent.right = OperandNode(value)
        }
      } else {
        if let l = op.left as? OperatorNode {
          calculate(parent: op, child: l)
        }

        if let r = op.right as? OperatorNode {
          calculate(parent: op, child: r)
        }
      }
    }
  }


  public func calculate() -> NSDecimalNumber {
    while !(root is OperandNode) {
      calculate(parent: root)
    }

    let node = root as! OperandNode
    return node.value
  }
}
