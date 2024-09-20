//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerSuccessView: View {
    var dismiss: DismissAction

    var body: some View {
        Text("This is DrawerSuccessView")

        Button("Close") {
            dismiss()
        }
    }
}

#Preview {
    @Environment(\.dismiss) var dismiss

    DrawerSuccessView(dismiss: dismiss)
}
