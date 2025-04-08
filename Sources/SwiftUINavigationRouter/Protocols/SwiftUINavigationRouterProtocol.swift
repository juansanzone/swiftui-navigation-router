//
//  SwiftUINavigationRouterProtocol.swift
//  SwiftUINavigationRouter
//
//  Created by Juan Sanzone on 04/04/2025.
//

import SwiftUI

public protocol SwiftUINavigationRouterProtocol: AnyObject, ObservableObject {
    associatedtype Destination: Hashable
    associatedtype DestinationView: View

    var navigationPath: NavigationPath { get set }

    func push(screen: Destination)
    func push(_ view: any Hashable)

    func pop()
    func popToRoot()

    @ViewBuilder
    func viewFor(for destination: Destination) -> DestinationView
}

public extension SwiftUINavigationRouterProtocol {
    func push(screen: Destination) {
        push(screen)
    }

    func push(_ view: any Hashable) {
        navigationPath.append(view)
    }

    func pop() {
        if !navigationPath.isEmpty {
            navigationPath.removeLast()
        }
    }

    func popToRoot() {
        navigationPath = NavigationPath()
    }
}
