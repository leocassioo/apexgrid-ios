import SwiftUI

struct EventsView: View {
    @StateObject private var viewModel = EventsViewModel()

    var body: some View {
        ZStack {
            AppTheme.backgroundGradient
                .ignoresSafeArea()

            content
        }
        .navigationTitle(viewModel.navigationTitle)
        .navigationBarTitleDisplayMode(.large)
        .toolbar {
            ToolbarItemGroup(placement: .topBarTrailing) {
                Button(action: {}) {
                    Image(systemName: "bell.badge.fill")
                }

                Button(action: {}) {
                    Image(systemName: "slider.horizontal.3")
                }
            }
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
        .onAppear {
            viewModel.onAppear()
        }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            loadingState
        case .failed(let message):
            errorState(message: message)
        case .empty:
            emptyState
        case .loaded:
            loadedState
        }
    }

    private var loadingState: some View {
        VStack(spacing: 14) {
            ProgressView()
                .tint(AppTheme.neonOrange)
                .scaleEffect(1.15)

            Text("Carregando agenda da comunidade...")
                .font(.system(.body, design: .rounded).weight(.semibold))
                .foregroundStyle(AppTheme.textSecondary)
        }
    }

    private var emptyState: some View {
        VStack(spacing: 14) {
            Image(systemName: "calendar.badge.exclamationmark")
                .font(.system(size: 40, weight: .bold))
                .foregroundStyle(AppTheme.neonBlue)

            Text("Nenhum evento no radar")
                .font(.system(.title3, design: .rounded).weight(.bold))
                .foregroundStyle(AppTheme.textPrimary)

            Text("Assim que um organizador publicar, voce ve tudo aqui.")
                .font(.system(.body, design: .rounded))
                .foregroundStyle(AppTheme.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
        }
    }

    private func errorState(message: String) -> some View {
        VStack(spacing: 14) {
            Image(systemName: "wifi.exclamationmark")
                .font(.system(size: 38, weight: .bold))
                .foregroundStyle(AppTheme.neonOrange)

            Text("Erro ao carregar")
                .font(.system(.title3, design: .rounded).weight(.bold))
                .foregroundStyle(AppTheme.textPrimary)

            Text(message)
                .font(.system(.body, design: .rounded))
                .foregroundStyle(AppTheme.textSecondary)
                .multilineTextAlignment(.center)
                .padding(.horizontal)

            Button("Tentar novamente") {
                viewModel.retry()
            }
            .font(.system(.subheadline, design: .rounded).weight(.bold))
            .buttonStyle(.borderedProminent)
            .tint(AppTheme.neonOrange)
        }
        .padding()
    }

    private var loadedState: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading, spacing: 18) {
                EventsHeroView(
                    activeEventsCount: viewModel.activeEventsCount,
                    confirmedPilotsCount: viewModel.totalConfirmedPilots,
                    waitlistCount: viewModel.totalWaitlist
                )

                filtersRow

                if viewModel.filteredEvents.isEmpty {
                    Text("Nenhum evento para o filtro selecionado.")
                        .font(.system(.subheadline, design: .rounded).weight(.medium))
                        .foregroundStyle(AppTheme.textSecondary)
                        .padding(.top, 6)
                } else {
                    LazyVStack(spacing: 12) {
                        ForEach(viewModel.filteredEvents) { event in
                            EventCardView(event: event)
                        }
                    }
                }
            }
            .padding(.horizontal, 16)
            .padding(.top, 10)
            .padding(.bottom, 30)
        }
        .refreshable {
            await viewModel.refresh()
        }
    }

    private var filtersRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 8) {
                ForEach(EventFilter.allCases) { filter in
                    EventFilterChip(
                        filter: filter,
                        isSelected: viewModel.selectedFilter == filter
                    ) {
                        viewModel.selectedFilter = filter
                    }
                }
            }
            .padding(.vertical, 2)
        }
    }
}

#Preview {
    NavigationStack {
        EventsView()
    }
}
