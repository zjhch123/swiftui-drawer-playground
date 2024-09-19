//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerContentView2: View {
    let navigationController: UINavigationController

    var body: some View {
        Text("This is DrawerContentView2")
        Button("Close") {
            navigationController.dismiss(animated: true)
        }
    }
}

#Preview {
    DrawerContentView2(
        navigationController: UINavigationController()
    )
}
