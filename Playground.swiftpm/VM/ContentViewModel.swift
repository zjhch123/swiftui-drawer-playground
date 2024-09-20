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

        let contentVC = UIHostingController(
            rootView: DrawerLandingView()
        )

        rootViewController?.present(
            MyDrawerController(contentVC: contentVC),
            animated: true
        )
    }
}
