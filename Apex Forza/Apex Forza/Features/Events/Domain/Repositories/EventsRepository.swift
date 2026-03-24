import Foundation

protocol EventsRepository {
    func fetchUpcomingEvents() async throws -> [ForzaEvent]
}
