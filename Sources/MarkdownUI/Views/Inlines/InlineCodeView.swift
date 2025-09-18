import SwiftUI

struct InlineCodeView: View {
  @Environment(\.theme.code) private var code

  private let content: String

  init(_ content: String) {
    self.content = content
  }

  var body: some View {
    Text(self.content)
      .textStyle(self.code)
  }
}