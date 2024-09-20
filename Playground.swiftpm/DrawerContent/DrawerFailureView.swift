//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerFailureView: View {
    @EnvironmentObject var router: DrawerViewRouter
    var dismiss: DismissAction

    var body: some View {
        Text("This is DrawerFailureView")

        Button("Close") {
            dismiss()
        }

        Button("Retry") {
            router.navigateBack(animate: false)
        }

        Button("Back to home") {
            router.navigateToRoot()
        }
    }
}

#Preview {
    @Environment(\.dismiss) var dismiss

    DrawerFailureView(dismiss: dismiss)
}
