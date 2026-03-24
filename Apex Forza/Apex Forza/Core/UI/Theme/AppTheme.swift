import SwiftUI

enum AppTheme {
    static let backgroundTop = Color(red: 0.07, green: 0.09, blue: 0.17)
    static let backgroundBottom = Color(red: 0.02, green: 0.03, blue: 0.07)
    static let panel = Color(red: 0.10, green: 0.12, blue: 0.21)
    static let panelStroke = Color.white.opacity(0.14)
    static let tabBarBackground = Color(red: 0.05, green: 0.06, blue: 0.12)

    static let neonOrange = Color(red: 1.00, green: 0.45, blue: 0.15)
    static let neonBlue = Color(red: 0.12, green: 0.86, blue: 0.98)
    static let neonLime = Color(red: 0.67, green: 1.00, blue: 0.32)

    static let textPrimary = Color.white.opacity(0.96)
    static let textSecondary = Color.white.opacity(0.68)

    static let backgroundGradient = LinearGradient(
        colors: [backgroundTop, backgroundBottom],
        startPoint: .topLeading,
        endPoint: .bottomTrailing
    )
}
