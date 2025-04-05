import SwiftUINavigationRouter

final class Router: SwiftUINavigationRouterProtocol {
    @Published var navigationPath: NavigationPath = .init()
}

extension Router {
    enum Destination: Hashable {
        case detailView
        case successView(paymentID: String)
    }
}

extension Router {
    @ViewBuilder
    func viewFor(for destination: Destination) -> some View {
        switch destination {
        case .detailView:
            DetailView()
        case .successView(paymentID: let paymentID):
            SuccessView(paymentID: paymentID)
        }
    }
}
