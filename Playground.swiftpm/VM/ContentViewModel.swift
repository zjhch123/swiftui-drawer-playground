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

        let myDC = MyDrawerController(contentVC: contentVC)
        myDC.delegate = self

        rootViewController?.present(myDC, animated: true)
    }
}

extension ContentViewModel: DrawerControllerDelegate {
    func drawerControllerWillDismiss(_ controller: DrawerController) {
        print("will dismiss")
    }
    
    func drawerControllerDidDismiss(_ controller: DrawerController) {
        print("did dismiss")
    }
}
