# SWExpression

## Requirements

- iOS 11.0+
- Xcode 11.0+
- Swift 5.3+

## Installation

### Swift Package Manager

The [Swift Package Manager](https://swift.org/package-manager/) is a tool for automating the distribution of Swift code and is integrated into the `swift` compiler.

To add SWExpression to your Xcode project, select `File > Add Packages` and enter repository URL:

```
https://github.com/0x3337/SWExpression
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate SWExpression into your project manually.

## Usage

### Quick Start

```swift
import SWExpression

let expression = SWExpression(format: "3337 + 27 * 1991 / 5.5")
let result: Decimal = expression.evaluate() // 13111
```

## License
SWExpression is released under the MIT license. See LICENSE for details.
