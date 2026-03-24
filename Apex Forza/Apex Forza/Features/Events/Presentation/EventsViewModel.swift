import Foundation
import Combine

enum EventsScreenState: Equatable {
    case loading
    case loaded
    case empty
    case failed(message: String)
}

enum EventFilter: String, CaseIterable, Identifiable {
    case all = "Todos"
    case roadRacing = "Road Racing"
    case streetScene = "Street Scene"
    case dirtRacing = "Dirt Racing"
    case drift = "Drift Zone"
    case photoMeet = "Photo Meet"

    var id: String { rawValue }

    var iconName: String {
        switch self {
        case .all:
            return "sparkles"
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

    func matches(_ event: ForzaEvent) -> Bool {
        switch self {
        case .all:
            return true
        case .roadRacing:
            return event.eventType == .roadRacing
        case .streetScene:
            return event.eventType == .streetScene
        case .dirtRacing:
            return event.eventType == .dirtRacing
        case .drift:
            return event.eventType == .drift
        case .photoMeet:
            return event.eventType == .photoMeet
        }
    }
}

final class EventsViewModel: BaseViewModel {
    private(set) var state: EventsScreenState = .loading
    private(set) var events: [ForzaEvent] = []
    var selectedFilter: EventFilter = .all {
        didSet {
            guard oldValue != selectedFilter else { return }
            objectWillChange.send()
        }
    }

    let navigationTitle = "Eventos FH5"

    private let getUpcomingEventsUseCase: any GetUpcomingEventsUseCase
    private var hasLoaded = false

    init(
        getUpcomingEventsUseCase: any GetUpcomingEventsUseCase = DefaultGetUpcomingEventsUseCase(
            repository: MockEventsRepository()
        )
    ) {
        self.getUpcomingEventsUseCase = getUpcomingEventsUseCase
    }

    override func onAppear() {
        guard !hasLoaded else { return }
        hasLoaded = true

        Task {
            await loadEvents(showLoading: true)
        }
    }

    var filteredEvents: [ForzaEvent] {
        events.filter { selectedFilter.matches($0) }
    }

    var activeEventsCount: Int {
        events.count
    }

    var totalConfirmedPilots: Int {
        events.reduce(into: 0) { partialResult, event in
            partialResult += event.confirmedPilots
        }
    }

    var totalConvoySlots: Int {
        events.reduce(into: 0) { partialResult, event in
            partialResult += event.convoySlots
        }
    }

    var totalWaitlist: Int {
        events.reduce(into: 0) { partialResult, event in
            partialResult += event.waitlistCount
        }
    }

    func retry() {
        Task {
            await loadEvents(showLoading: true)
        }
    }

    func refresh() async {
        await loadEvents(showLoading: false)
    }

    private func loadEvents(showLoading: Bool) async {
        if showLoading {
            updateState(.loading)
        }

        do {
            let upcomingEvents = try await getUpcomingEventsUseCase.execute()
            objectWillChange.send()
            events = upcomingEvents
            state = upcomingEvents.isEmpty ? .empty : .loaded
        } catch {
            objectWillChange.send()
            events = []
            state = .failed(message: "Nao foi possivel carregar os eventos mockados.")
        }
    }

    private func updateState(_ newValue: EventsScreenState) {
        objectWillChange.send()
        state = newValue
    }
}
