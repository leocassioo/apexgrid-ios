import SwiftUI

struct EventCardView: View {
    let event: ForzaEvent

    private var accentColor: Color {
        switch event.eventType {
        case .roadRacing:
            return AppTheme.neonBlue
        case .streetScene:
            return AppTheme.neonOrange
        case .dirtRacing:
            return AppTheme.neonLime
        case .drift:
            return Color(red: 1.00, green: 0.61, blue: 0.17)
        case .photoMeet:
            return Color(red: 0.12, green: 0.86, blue: 0.98)
        }
    }

    private var eventRuleItems: [EventRuleItem] {
        var items: [EventRuleItem] = []

        if let piLimit = event.rules.piLimit {
            items.append(EventRuleItem(icon: "speedometer", text: "PI \(piLimit)"))
        }
        if let drivetrain = event.rules.drivetrain {
            items.append(EventRuleItem(icon: "arrow.triangle.branch", text: drivetrain.rawValue))
        }
        if let assists = event.rules.assists {
            items.append(EventRuleItem(icon: "steeringwheel", text: assists.rawValue))
        }
        if let collision = event.rules.collision {
            items.append(EventRuleItem(icon: "car.2.fill", text: "Colisão \(collision.rawValue)"))
        }
        if let weather = event.rules.weather {
            items.append(EventRuleItem(icon: weather.iconName, text: weather.rawValue))
        }
        if let timeOfDay = event.rules.timeOfDay {
            items.append(EventRuleItem(icon: timeOfDay.iconName, text: timeOfDay.rawValue))
        }

        return items
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            HStack(spacing: 8) {
                Label(event.eventType.rawValue, systemImage: event.eventType.iconName)
                    .font(.system(.caption, design: .rounded).weight(.bold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(accentColor.opacity(0.16), in: Capsule())
                    .foregroundStyle(accentColor)

                Spacer()

                Text(event.startsAt.formatted(.dateTime.weekday(.abbreviated).hour().minute()))
                    .font(.system(.caption, design: .rounded).weight(.semibold))
                    .foregroundStyle(AppTheme.textSecondary)
            }

            VStack(alignment: .leading, spacing: 6) {
                Text(event.title)
                    .font(.system(.headline, design: .rounded).weight(.bold))
                    .foregroundStyle(AppTheme.textPrimary)

                Text(event.subtitle)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(AppTheme.textSecondary)
            }

            HStack(spacing: 8) {
                EventInfoBadge(icon: "mappin.and.ellipse", text: event.location)
                EventInfoBadge(icon: "car.fill", text: "Classe \(event.carClass.rawValue)")
                EventInfoBadge(icon: "gamecontroller.fill", text: event.requiredInput.rawValue)
            }

            if !eventRuleItems.isEmpty {
                VStack(alignment: .leading, spacing: 8) {
                    Text("Regras do host")
                        .font(.system(.caption, design: .rounded).weight(.bold))
                        .foregroundStyle(AppTheme.textSecondary)

                    LazyVGrid(
                        columns: [
                            GridItem(.flexible(minimum: 110), spacing: 8),
                            GridItem(.flexible(minimum: 110), spacing: 8)
                        ],
                        alignment: .leading,
                        spacing: 8
                    ) {
                        ForEach(eventRuleItems) { item in
                            EventRuleBadge(icon: item.icon, text: item.text)
                        }
                    }
                }
            }

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text("Vagas no comboio")
                        .font(.system(.caption, design: .rounded).weight(.medium))
                        .foregroundStyle(AppTheme.textSecondary)

                    Spacer()

                    Text("\(event.confirmedPilots)/\(event.convoySlots)")
                        .font(.system(.caption, design: .rounded).weight(.bold))
                        .foregroundStyle(AppTheme.textPrimary)
                }

                ProgressView(value: event.occupancyProgress)
                    .tint(accentColor)

                if event.waitlistCount > 0 {
                    Text("Lista de espera: \(event.waitlistCount) pilotos")
                        .font(.system(.caption2, design: .rounded).weight(.semibold))
                        .foregroundStyle(accentColor)
                }
            }

            HStack {
                Label(event.organizerGamertag, systemImage: "person.fill")
                    .font(.system(.caption, design: .rounded).weight(.medium))
                    .foregroundStyle(AppTheme.textSecondary)

                Spacer()

                Label("Rep \(event.reputationRequired)+", systemImage: "star.fill")
                    .font(.system(.caption, design: .rounded).weight(.medium))
                    .foregroundStyle(AppTheme.textSecondary)
            }
        }
        .padding(16)
        .background(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .fill(AppTheme.panel.opacity(0.94))
        )
        .overlay(
            RoundedRectangle(cornerRadius: 22, style: .continuous)
                .stroke(accentColor.opacity(0.35), lineWidth: 1)
        )
        .overlay(alignment: .topTrailing) {
            if event.highlightLevel == .featured {
                Text("DESTAQUE")
                    .font(.system(.caption2, design: .rounded).weight(.black))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 6)
                    .background(accentColor, in: Capsule())
                    .foregroundStyle(Color.black.opacity(0.85))
                    .padding(10)
            }
        }
    }
}

private struct EventInfoBadge: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 5) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.system(.caption2, design: .rounded).weight(.semibold))
        .foregroundStyle(AppTheme.textSecondary)
        .lineLimit(1)
        .padding(.horizontal, 8)
        .padding(.vertical, 6)
        .background(Color.white.opacity(0.06), in: Capsule())
    }
}

private struct EventRuleItem: Identifiable {
    let icon: String
    let text: String

    var id: String {
        "\(icon)-\(text)"
    }
}

private struct EventRuleBadge: View {
    let icon: String
    let text: String

    var body: some View {
        HStack(spacing: 6) {
            Image(systemName: icon)
            Text(text)
        }
        .font(.system(.caption2, design: .rounded).weight(.bold))
        .foregroundStyle(AppTheme.textPrimary)
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 10)
        .padding(.vertical, 8)
        .background(Color.white.opacity(0.08), in: RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
}

#Preview {
    let event = ForzaEvent(
        id: UUID(),
        title: "Noite de Cruise S1",
        subtitle: "Comboio limpo para role e fotos.",
        startsAt: .now,
        location: "Festival Horizon Mexico",
        organizerGamertag: "RafaApexHost",
        eventType: .roadRacing,
        carClass: .s1,
        convoySlots: 12,
        confirmedPilots: 9,
        waitlistCount: 3,
        requiredInput: .mixed,
        rules: EventRules(
            piLimit: "S1 900",
            drivetrain: .awd,
            assists: .free,
            collision: .off,
            weather: .clear,
            timeOfDay: .sunset
        ),
        reputationRequired: 70,
        highlightLevel: .featured
    )

    ZStack {
        AppTheme.backgroundGradient
            .ignoresSafeArea()
        EventCardView(event: event)
            .padding()
    }
}
