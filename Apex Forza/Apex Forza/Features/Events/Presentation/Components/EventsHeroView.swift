import SwiftUI

struct EventsHeroView: View {
    let activeEventsCount: Int
    let confirmedPilotsCount: Int
    let waitlistCount: Int

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(alignment: .top) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Forza Horizon 5")
                        .font(.system(.subheadline, design: .rounded).weight(.bold))
                        .foregroundStyle(AppTheme.neonBlue)

                    Text("Agenda da comunidade")
                        .font(.system(.title2, design: .rounded).weight(.black))
                        .foregroundStyle(AppTheme.textPrimary)
                }

                Spacer()

                Image(systemName: "bolt.car.fill")
                    .font(.system(size: 24, weight: .bold))
                    .foregroundStyle(AppTheme.neonOrange)
            }

            HStack(spacing: 12) {
                StatItem(label: "Ativos", value: "\(activeEventsCount)")
                StatItem(label: "Confirmados", value: "\(confirmedPilotsCount)")
                StatItem(label: "Fila", value: "\(waitlistCount)")
            }
        }
        .padding(18)
        .background(
            LinearGradient(
                colors: [AppTheme.panel, AppTheme.panel.opacity(0.75)],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            ),
            in: RoundedRectangle(cornerRadius: 24, style: .continuous)
        )
        .overlay(
            RoundedRectangle(cornerRadius: 24, style: .continuous)
                .stroke(
                    LinearGradient(
                        colors: [AppTheme.neonBlue.opacity(0.55), AppTheme.neonOrange.opacity(0.55)],
                        startPoint: .leading,
                        endPoint: .trailing
                    ),
                    lineWidth: 1.2
                )
        )
    }
}

private struct StatItem: View {
    let label: String
    let value: String

    var body: some View {
        VStack(alignment: .leading, spacing: 3) {
            Text(value)
                .font(.system(.headline, design: .rounded).weight(.black))
                .foregroundStyle(AppTheme.textPrimary)
            Text(label)
                .font(.system(.caption2, design: .rounded).weight(.semibold))
                .foregroundStyle(AppTheme.textSecondary)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(10)
        .background(Color.white.opacity(0.06), in: RoundedRectangle(cornerRadius: 12, style: .continuous))
    }
}
