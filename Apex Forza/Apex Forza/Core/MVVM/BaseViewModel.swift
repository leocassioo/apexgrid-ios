import Combine

@MainActor
class BaseViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()

    func onAppear() {}
}
