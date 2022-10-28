import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Leetcode").font(.title)
            Button("Run Again") {
                run()
            }
            Spacer()
        }
        .padding()
        .onAppear {
            run()
        }
    }
}

extension ContentView {
    func run() {
        Solution200().submit()
    }
}
