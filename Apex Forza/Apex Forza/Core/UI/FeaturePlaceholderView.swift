import SwiftUI

struct FeaturePlaceholderView: View {
    let icon: String
    let title: String
    let message: String

    var body: some View {
        ZStack {
            AppTheme.backgroundGradient
                .ignoresSafeArea()

            VStack(spacing: 12) {
                Image(systemName: icon)
                    .font(.system(size: 38, weight: .bold, design: .rounded))
                    .foregroundStyle(AppTheme.neonBlue)

                Text(title)
                    .font(.system(.title3, design: .rounded).weight(.bold))
                    .foregroundStyle(AppTheme.textPrimary)

                Text(message)
                    .font(.system(.body, design: .rounded))
                    .foregroundStyle(AppTheme.textSecondary)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 8)
            }
            .padding(24)
            .background(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .fill(AppTheme.panel.opacity(0.9))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 24, style: .continuous)
                    .stroke(AppTheme.panelStroke, lineWidth: 1)
            )
            .padding()
        }
    }
}

#Preview {
    FeaturePlaceholderView(
        icon: "hammer",
        title: "Em construção",
        message: "Espaço reservado para evoluirmos este módulo."
    )
}
