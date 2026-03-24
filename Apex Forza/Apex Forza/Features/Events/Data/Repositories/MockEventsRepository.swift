import Foundation

final class MockEventsRepository: EventsRepository {
    func fetchUpcomingEvents() async throws -> [ForzaEvent] {
        try await Task.sleep(nanoseconds: 450_000_000)

        let calendar = Calendar.current
        let now = Date()

        func dateIn(hours: Int) -> Date {
            calendar.date(byAdding: .hour, value: hours, to: now) ?? now
        }

        return [
            ForzaEvent(
                id: UUID(),
                title: "Volcan Sprint - PI S1 900",
                subtitle: "Road Racing com tune de grip. Assistencias livres e largada organizada.",
                startsAt: dateIn(hours: 2),
                location: "Horizon Apex Outpost",
                organizerGamertag: "RafaApexHost",
                eventType: .roadRacing,
                carClass: .s1,
                convoySlots: 12,
                confirmedPilots: 10,
                waitlistCount: 4,
                requiredInput: .mixed,
                rules: EventRules(
                    piLimit: "S1 900",
                    drivetrain: .awd,
                    assists: .free,
                    collision: .off,
                    weather: .clear,
                    timeOfDay: .day
                ),
                reputationRequired: 70,
                highlightLevel: .featured
            ),
            ForzaEvent(
                id: UUID(),
                title: "Street Scene Guanajuato",
                subtitle: "Evento noturno com trafego ligado e foco em consistencia de volta.",
                startsAt: dateIn(hours: 4),
                location: "Guanajuato - Entrada Leste",
                organizerGamertag: "SlideKingsBR",
                eventType: .streetScene,
                carClass: .a,
                convoySlots: 10,
                confirmedPilots: 8,
                waitlistCount: 2,
                requiredInput: .mixed,
                rules: EventRules(
                    piLimit: "A 800",
                    collision: .on,
                    weather: .cloudy,
                    timeOfDay: .night
                ),
                reputationRequired: 65,
                highlightLevel: .regular
            ),
            ForzaEvent(
                id: UUID(),
                title: "Teotihuacan Scramble",
                subtitle: "Dirt Racing com PI B 700. AWD recomendado para chuva.",
                startsAt: dateIn(hours: 6),
                location: "Horizon Wilds Outpost",
                organizerGamertag: "NeoRacingHub",
                eventType: .dirtRacing,
                carClass: .b,
                convoySlots: 12,
                confirmedPilots: 12,
                waitlistCount: 6,
                requiredInput: .controller,
                rules: EventRules(
                    piLimit: "B 700",
                    drivetrain: .awd,
                    assists: .absAndTcsOnly,
                    weather: .rain
                ),
                reputationRequired: 75,
                highlightLevel: .featured
            ),
            ForzaEvent(
                id: UUID(),
                title: "Drift Zone Cara Este",
                subtitle: "Sessao tandem com clipping points e revisao de linhas no replay.",
                startsAt: dateIn(hours: 9),
                location: "Cordillera - Drift Zone",
                organizerGamertag: "LensDriftMX",
                eventType: .drift,
                carClass: .a,
                convoySlots: 10,
                confirmedPilots: 9,
                waitlistCount: 3,
                requiredInput: .wheel,
                rules: EventRules(
                    piLimit: "A 800",
                    drivetrain: .rwd,
                    assists: .simulation,
                    collision: .off,
                    timeOfDay: .sunset
                ),
                reputationRequired: 60,
                highlightLevel: .regular
            ),
            ForzaEvent(
                id: UUID(),
                title: "Photo Meet - Festival",
                subtitle: "Sessao de foto no por do sol com spotlight para liveries autorais.",
                startsAt: dateIn(hours: 12),
                location: "Horizon Mexico Festival",
                organizerGamertag: "OldSchoolVibes",
                eventType: .photoMeet,
                carClass: .a,
                convoySlots: 16,
                confirmedPilots: 6,
                waitlistCount: 0,
                requiredInput: .mixed,
                rules: EventRules(),
                reputationRequired: 45,
                highlightLevel: .regular
            ),
            ForzaEvent(
                id: UUID(),
                title: "Estadio Circuit Attack",
                subtitle: "Road Racing PI S2 998 para hotlap em pelotao controlado.",
                startsAt: dateIn(hours: 18),
                location: "Estadio Circuit",
                organizerGamertag: "ApexCoach",
                eventType: .roadRacing,
                carClass: .s2,
                convoySlots: 12,
                confirmedPilots: 5,
                waitlistCount: 0,
                requiredInput: .controller,
                rules: EventRules(
                    piLimit: "S2 998",
                    assists: .free,
                    collision: .off
                ),
                reputationRequired: 80,
                highlightLevel: .regular
            )
        ]
    }
}
