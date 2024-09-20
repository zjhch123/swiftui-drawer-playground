//
//  DrawerViewRouter.swift
//  Playground
//
//  Created by 张益达 on 9/20/24.
//

import SwiftUI

enum Destination: Codable, Hashable {
    case landing
    case loading
    case success
    case failure
}

final class DrawerViewRouter: ObservableObject {
    @Published var navPath = NavigationPath()

    func navigate(to destination: Destination, animate: Bool = true) {
        var transaction = Transaction()
        transaction.disablesAnimations = !animate
        withTransaction(transaction) {
            navPath.append(destination)
        }
    }

    func navigateBack(animate: Bool = true) {
        var transaction = Transaction()
        transaction.disablesAnimations = !animate
        withTransaction(transaction) {
            navPath.removeLast()
        }
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
