import SwiftUI

struct HomeView: View {
    
    @StateObject private var router: Router = .init()
    
    var body: some View {
        NavigationStack(path: $router.navigationPath) {
            VStack {
                Button("Push Detail View") {
                    router.push(screen: .detailView)
                }
            }
            .navigationDestination(for: Router.Destination.self, destination: { destination in
                router.viewFor(for: destination)
                    .environmentObject(router)
            })
            .navigationTitle("HomeView")
        }
    }
}
