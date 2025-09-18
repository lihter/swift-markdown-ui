import SwiftUI
import MarkdownUI

struct InlineCodeConfigurationView: View {
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        Group {
          Text("Inline Code Configuration Demo")
            .font(.title2)
            .fontWeight(.bold)

          Text("This demonstrates conditional styling of inline code based on content.")
            .foregroundColor(.secondary)

          Divider()

          Text("Standard Inline Code:")
            .font(.headline)

          Markdown {
            """
            Use `git status` to check repository status and `npm install` to install dependencies.
            """
          }

          Divider()

          Text("Conditional Styling (mask keyword):")
            .font(.headline)

          Markdown {
            """
            For security, never expose `API_KEY` or `mask_secret` values.
            Use `config.load()` but protect any `mask` related data carefully.

            Examples:
            - Safe: `username`, `email`, `id`
            - Sensitive: `password_mask`, `token_mask`, `secret`
            """
          }
          .markdownTheme(
            Theme()
              .inlineCode { configuration in
                let hasMask = configuration.content.contains("mask")
                return configuration.label
                  .padding(.horizontal, 6)
                  .padding(.vertical, 2)
                  .background(hasMask ? Color.red.opacity(0.2) : Color.blue.opacity(0.1))
                  .foregroundColor(hasMask ? .red : .blue)
                  .cornerRadius(4)
                  .overlay(
                    RoundedRectangle(cornerRadius: 4)
                      .stroke(hasMask ? Color.red.opacity(0.5) : Color.blue.opacity(0.3), lineWidth: 1)
                  )
              }
          )

          Divider()

          Text("Multiple Keywords Demo:")
            .font(.headline)

          Markdown {
            """
            Different styling rules:
            - `normal_code` - standard styling
            - `secret_mask` - sensitive data (red)
            - `debug_flag` - debug related (yellow)
            - `config_value` - configuration (green)
            """
          }
          .markdownTheme(
            Theme()
              .inlineCode { configuration in
                let content = configuration.content
                let color: Color
                let bgColor: Color

                if content.contains("mask") || content.contains("secret") {
                  color = .red
                  bgColor = Color.red.opacity(0.15)
                } else if content.contains("debug") {
                  color = .orange
                  bgColor = Color.orange.opacity(0.15)
                } else if content.contains("config") {
                  color = .green
                  bgColor = Color.green.opacity(0.15)
                } else {
                  color = .primary
                  bgColor = Color.gray.opacity(0.1)
                }

                return configuration.label
                  .padding(.horizontal, 4)
                  .padding(.vertical, 2)
                  .background(bgColor)
                  .foregroundColor(color)
                  .cornerRadius(3)
              }
          )
        }
      }
      .padding()
    }
    .navigationTitle("Inline Code Config")
    .navigationBarTitleDisplayMode(.inline)
  }
}

struct InlineCodeConfigurationView_Previews: PreviewProvider {
  static var previews: some View {
    NavigationView {
      InlineCodeConfigurationView()
    }
  }
}