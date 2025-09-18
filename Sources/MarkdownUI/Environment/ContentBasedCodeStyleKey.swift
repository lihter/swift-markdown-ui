import SwiftUI

private struct ContentBasedCodeStyleKey: EnvironmentKey {
  static let defaultValue: ((String) -> TextStyle)? = nil
}

extension EnvironmentValues {
  var contentBasedCodeStyle: ((String) -> TextStyle)? {
    get { self[ContentBasedCodeStyleKey.self] }
    set { self[ContentBasedCodeStyleKey.self] = newValue }
  }
}