import SwiftUI

public struct ContentBasedTextStyle: TextStyle {
  private let styles: [TextStyle]

  public init(_ styles: [TextStyle]) {
    self.styles = styles
  }

  public func _collectAttributes(in attributes: inout AttributeContainer) {
    for style in styles {
      style._collectAttributes(in: &attributes)
    }
  }
}

// Helper to create ContentBasedTextStyle from multiple styles
public func combineTextStyles(_ styles: TextStyle...) -> ContentBasedTextStyle {
  ContentBasedTextStyle(styles)
}