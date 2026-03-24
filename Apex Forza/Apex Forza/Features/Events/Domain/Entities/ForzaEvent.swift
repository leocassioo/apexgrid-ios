import Foundation

struct ForzaEvent: Identifiable, Equatable {
    let id: UUID
    let title: String
    let subtitle: String
    let startsAt: Date
    let location: String
    let organizerGamertag: String
    let eventType: EventType
    let carClass: CarClass
    let convoySlots: Int
    let confirmedPilots: Int
    let waitlistCount: Int
    let requiredInput: InputType
    let rules: EventRules
    let reputationRequired: Int
    let highlightLevel: HighlightLevel

    var occupancyProgress: Double {
        guard convoySlots > 0 else { return 0 }
        return min(Double(confirmedPilots) / Double(convoySlots), 1)
    }
}

struct EventRules: Equatable {
    let piLimit: String?
    let drivetrain: DrivetrainRule?
    let assists: AssistRule?
    let collision: CollisionRule?
    let weather: WeatherCondition?
    let timeOfDay: SessionTimeOfDay?

    init(
        piLimit: String? = nil,
        drivetrain: DrivetrainRule? = nil,
        assists: AssistRule? = nil,
        collision: CollisionRule? = nil,
        weather: WeatherCondition? = nil,
        timeOfDay: SessionTimeOfDay? = nil
    ) {
        self.piLimit = piLimit
        self.drivetrain = drivetrain
        self.assists = assists
        self.collision = collision
        self.weather = weather
        self.timeOfDay = timeOfDay
    }

    var isEmpty: Bool {
        piLimit == nil &&
        drivetrain == nil &&
        assists == nil &&
        collision == nil &&
        weather == nil &&
        timeOfDay == nil
    }
}

enum EventType: String, CaseIterable, Identifiable {
    case roadRacing = "Road Racing"
    case streetScene = "Street Scene"
    case dirtRacing = "Dirt Racing"
    case drift = "Drift Zone"
    case photoMeet = "Photo Meet"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .roadRacing:
            return "flag.checkered"
        case .streetScene:
            return "moon.stars.fill"
        case .dirtRacing:
            return "mountain.2.fill"
        case .drift:
            return "wind"
        case .photoMeet:
            return "camera.aperture"
        }
    }
}

enum CarClass: String, CaseIterable {
    case d = "D"
    case c = "C"
    case b = "B"
    case a = "A"
    case s1 = "S1"
    case s2 = "S2"
    case x = "X"
}

enum InputType: String, CaseIterable {
    case controller = "Controle"
    case wheel = "Volante"
    case mixed = "Misto"
}

enum DrivetrainRule: String, CaseIterable {
    case awd = "AWD"
    case rwd = "RWD"
    case fwd = "FWD"
    case any = "Livre"
}

enum AssistRule: String, CaseIterable {
    case simulation = "Simulação"
    case absAndTcsOnly = "ABS/TCS"
    case free = "Livre"
}

enum CollisionRule: String, CaseIterable {
    case on = "Ligada"
    case off = "Desligada"
}

enum WeatherCondition: String, CaseIterable {
    case clear = "Limpo"
    case cloudy = "Nublado"
    case rain = "Chuva"
    case storm = "Tempestade"

    var iconName: String {
        switch self {
        case .clear:
            return "sun.max.fill"
        case .cloudy:
            return "cloud.fill"
        case .rain:
            return "cloud.rain.fill"
        case .storm:
            return "cloud.bolt.rain.fill"
        }
    }
}

enum SessionTimeOfDay: String, CaseIterable {
    case dawn = "Amanhecer"
    case day = "Dia"
    case sunset = "Pôr do sol"
    case night = "Noite"

    var iconName: String {
        switch self {
        case .dawn:
            return "sunrise.fill"
        case .day:
            return "sun.max.fill"
        case .sunset:
            return "sunset.fill"
        case .night:
            return "moon.stars.fill"
        }
    }
}

enum HighlightLevel {
    case featured
    case regular
}
