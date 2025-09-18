import SwiftUI

/// The properties of a Markdown inline code span.
///
/// The theme ``Theme/code`` block style receives an `InlineCodeConfiguration`
/// input in its `body` closure.
public struct InlineCodeConfiguration {
  /// A type-erased view of a Markdown inline code span.
  public struct Label: View {
    init<L: View>(_ label: L) {
      self.body = AnyView(label)
    }

    public let body: AnyView
  }

  /// The inline code content.
  public let content: String

  /// The inline code view.
  public let label: Label
}