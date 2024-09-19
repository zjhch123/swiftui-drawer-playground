//
//  ContentViewModel.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

class ContentViewModel: ObservableObject {
    @MainActor
    func showDrawer() {
        let rootViewController = (UIApplication.shared.connectedScenes.first
                                  as? UIWindowScene)?.windows.first?.rootViewController

        let drawerContentNavigationController = UINavigationController()
        drawerContentNavigationController.isNavigationBarHidden = false
        drawerContentNavigationController.setViewControllers([
            UIHostingController(
                rootView: DrawerContentView(
                    navigationController: drawerContentNavigationController
                )
            )
        ], animated: false)

        rootViewController?.present(
            MyDrawerController(contentVC: drawerContentNavigationController),
            animated: true
        )
    }
}
