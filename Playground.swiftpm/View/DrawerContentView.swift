//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerContentView: View {
    let navigationController: UINavigationController

    var body: some View {
        Text("This is DrawerContentView")
        Button("Next page") {
            navigationController.pushViewController(
                UIHostingController(
                    rootView: DrawerContentView2(
                        navigationController: self.navigationController
                    )
                ),
                animated: true
            )
        }
    }
}

#Preview {
    DrawerContentView(
        navigationController: UINavigationController()
    )
}
