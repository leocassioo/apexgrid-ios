import SwiftUI

struct EventFilterChip: View {
    let filter: EventFilter
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            HStack(spacing: 6) {
                Image(systemName: filter.iconName)
                Text(filter.rawValue)
            }
            .font(.system(.caption, design: .rounded).weight(.bold))
            .padding(.horizontal, 12)
            .padding(.vertical, 9)
            .foregroundStyle(isSelected ? Color.black.opacity(0.85) : AppTheme.textPrimary)
            .background(
                Capsule()
                    .fill(isSelected ? AppTheme.neonOrange : Color.white.opacity(0.08))
            )
            .overlay(
                Capsule()
                    .stroke(isSelected ? AppTheme.neonOrange.opacity(0.9) : AppTheme.panelStroke, lineWidth: 1)
            )
        }
        .buttonStyle(.plain)
    }
}
