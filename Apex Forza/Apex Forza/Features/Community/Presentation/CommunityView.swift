import SwiftUI

struct CommunityView: View {
    @StateObject private var viewModel = CommunityViewModel()

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
        CommunityView()
    }
}
