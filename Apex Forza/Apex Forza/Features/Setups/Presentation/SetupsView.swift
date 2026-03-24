import SwiftUI

struct SetupsView: View {
    @StateObject private var viewModel = SetupsViewModel()

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
        SetupsView()
    }
}
