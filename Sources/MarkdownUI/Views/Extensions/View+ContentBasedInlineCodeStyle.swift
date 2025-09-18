import SwiftUI

extension View {
  /// Applies content-based styling to inline code while preserving proper text flow.
  /// - Parameter style: A closure that receives the inline code content and returns a text style
  public func markdownInlineCodeStyle<S: TextStyle>(_ style: @escaping (String) -> S) -> some View {
    self.environment(\.contentBasedCodeStyle) { content in
      style(content)
    }
  }
}