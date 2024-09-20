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

    var body: some View {
        NavigationStack(path: $router.navPath) {
            Text("DrawerLandingView")
            Button("Start!") {
                router.navigate(to: .loading)
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
        }.environmentObject(router)
    }
}

#Preview {
    DrawerLandingView()
}
