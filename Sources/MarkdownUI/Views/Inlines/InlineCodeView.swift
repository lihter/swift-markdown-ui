import SwiftUI

struct InlineCodeView: View {
  @Environment(\.theme.inlineCode) private var inlineCode

  private let content: String

  init(_ content: String) {
    self.content = content
  }

  var body: some View {
    self.inlineCode.makeBody(
      configuration: .init(
        content: self.content,
        label: .init(
          Text(self.content)
            .font(.system(.body, design: .monospaced))
        )
      )
    )
  }
}