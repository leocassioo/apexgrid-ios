import Foundation

protocol GetUpcomingEventsUseCase {
    func execute() async throws -> [ForzaEvent]
}

struct DefaultGetUpcomingEventsUseCase: GetUpcomingEventsUseCase {
    private let repository: EventsRepository

    init(repository: EventsRepository) {
        self.repository = repository
    }

    func execute() async throws -> [ForzaEvent] {
        let events = try await repository.fetchUpcomingEvents()
        return events.sorted { $0.startsAt < $1.startsAt }
    }
}
