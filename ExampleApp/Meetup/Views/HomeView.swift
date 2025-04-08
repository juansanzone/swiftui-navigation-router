import SwiftUINavigationRouter

struct HomeView: View {
    @StateObject private var router: Router = .init()
    
    var body: some View {
        SwiftUINavigationRouterView(router: router) {
            VStack {
                Button("Push Detail View") {
                    router.push(screen: .detailView)
                }
            }
            .navigationTitle("HomeView")
        }
    }
}
