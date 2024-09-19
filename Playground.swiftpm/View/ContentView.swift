import SwiftUI

struct ContentView: View {
    @StateObject var vm = ContentViewModel()

    var body: some View {
        VStack {
            Button("Show Drawer") {
                vm.showDrawer()
            }
        }
    }
}
