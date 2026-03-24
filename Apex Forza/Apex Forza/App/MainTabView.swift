import SwiftUI

enum AppTab: Int, Hashable {
    case events
    case setups
    case community
    case profile

    var title: String {
        switch self {
        case .events:
            return "Eventos"
        case .setups:
            return "Tunagens"
        case .community:
            return "Comunidade"
        case .profile:
            return "Perfil"
        }
    }

    var systemImage: String {
        switch self {
        case .events:
            return "calendar"
        case .setups:
            return "wrench.and.screwdriver"
        case .community:
            return "person.3"
        case .profile:
            return "person.crop.circle"
        }
    }
}

struct MainTabView: View {
    @State private var selectedTab: AppTab = .events

    var body: some View {
        TabView(selection: $selectedTab) {
            styledNavigation {
                EventsView()
            }
            .tabItem {
                Label(AppTab.events.title, systemImage: AppTab.events.systemImage)
            }
            .tag(AppTab.events)

            styledNavigation {
                SetupsView()
            }
            .tabItem {
                Label(AppTab.setups.title, systemImage: AppTab.setups.systemImage)
            }
            .tag(AppTab.setups)

            styledNavigation {
                CommunityView()
            }
            .tabItem {
                Label(AppTab.community.title, systemImage: AppTab.community.systemImage)
            }
            .tag(AppTab.community)

            styledNavigation {
                ProfileView()
            }
            .tabItem {
                Label(AppTab.profile.title, systemImage: AppTab.profile.systemImage)
            }
            .tag(AppTab.profile)
        }
        .tint(AppTheme.neonOrange)
        .toolbarBackground(AppTheme.tabBarBackground, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }

    private func styledNavigation<Content: View>(
        @ViewBuilder content: () -> Content
    ) -> some View {
        NavigationStack {
            content()
        }
        .toolbarColorScheme(.dark, for: .navigationBar)
        .toolbarBackground(AppTheme.backgroundTop, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
    }
}

#Preview {
    MainTabView()
}
