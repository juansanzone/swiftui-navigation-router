//
//  SwiftUINavigationRouterView.swift
//  SwiftUINavigationRouter
//
//  Created by Juan Sanzone on 08/04/2025.
//

import SwiftUI

public struct SwiftUINavigationRouterView<Router: SwiftUINavigationRouterProtocol, Content: View>: View {
    @ObservedObject private var router: Router
    private let content: Content

    public init(router: Router, @ViewBuilder content: () -> Content) {
        self.router = router
        self.content = content()
    }

    public var body: some View {
        NavigationStack(path: $router.navigationPath) {
            content
                .navigationDestination(for: Router.Destination.self) { destination in
                    router.viewFor(for: destination)
                        .environmentObject(router)
                }
        }
    }
}
