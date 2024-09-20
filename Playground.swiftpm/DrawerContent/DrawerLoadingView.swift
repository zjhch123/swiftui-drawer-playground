//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerLoadingView: View {
    @EnvironmentObject var router: DrawerViewRouter

    var body: some View {
        VStack(spacing: 6) {
            Text("DrawerLoadingView")

            Button("Success") {
                router.navigate(to: .success, animate: false)
            }
            Button("Failure") {
                router.navigate(to: .failure, animate: false)
            }
        }
    }
}

#Preview {
    DrawerLoadingView()
}
