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

    func navigate(to destination: Destination) {
        navPath.append(destination)
    }

    func navigateBack() {
        navPath.removeLast()
    }

    func navigateToRoot() {
        navPath.removeLast(navPath.count)
    }
}
