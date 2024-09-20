//
//  SwiftUIView.swift
//  Playground
//
//  Created by 张益达 on 9/19/24.
//

import SwiftUI
import UIKit

struct DrawerLandingView: View {
    @StateObject var router = DrawerViewRouter()
    @Environment(\.dismiss) var dismiss

    var Content: some View {
        VStack(spacing: 4) {
            Text("DrawerLandingView")
            Button("Close") {
                dismiss()
            }
            Button("Start") {
                router.navigate(to: .loading, animate: false)
            }
        }
        .navigationDestination(for: Destination.self) { dest in
            switch dest {
            case .loading:
                DrawerLoadingView()
                    .navigationBarBackButtonHidden()
            case .success:
                DrawerSuccessView(dismiss: dismiss)
                    .navigationBarBackButtonHidden()
            case .failure:
                DrawerFailureView(dismiss: dismiss)
                    .navigationBarBackButtonHidden()
            default:
                AnyView(EmptyView())
            }
        }
    }

    var body: some View {
        NavigationStack(path: $router.navPath) {
            Content
        }.environmentObject(router)
    }
}

#Preview {
    DrawerLandingView()
}
