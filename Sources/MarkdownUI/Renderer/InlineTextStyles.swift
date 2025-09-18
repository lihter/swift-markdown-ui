import Foundation

struct InlineTextStyles {
  let code: TextStyle
  let emphasis: TextStyle
  let strong: TextStyle
  let strikethrough: TextStyle
  let link: TextStyle
  let contentBasedCodeStyle: ((String) -> TextStyle)?

  init(code: TextStyle, emphasis: TextStyle, strong: TextStyle, strikethrough: TextStyle, link: TextStyle, contentBasedCodeStyle: ((String) -> TextStyle)? = nil) {
    self.code = code
    self.emphasis = emphasis
    self.strong = strong
    self.strikethrough = strikethrough
    self.link = link
    self.contentBasedCodeStyle = contentBasedCodeStyle
  }
}
