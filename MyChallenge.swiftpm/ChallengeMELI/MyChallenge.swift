import SwiftUI

@main
struct MyChallenge: App {
    @StateObject private var viewModel = SearchViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SearchView()
            }
            .environmentObject(viewModel)
        }
    }
}
