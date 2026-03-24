import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()

    var body: some View {
        FeaturePlaceholderView(
            icon: viewModel.placeholderIcon,
            title: viewModel.placeholderTitle,
            message: viewModel.placeholderMessage
        )
        .navigationTitle(viewModel.navigationTitle)
        .onAppear {
            viewModel.onAppear()
        }
    }
}

#Preview {
    NavigationStack {
        ProfileView()
    }
}
