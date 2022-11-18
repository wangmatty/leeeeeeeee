import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Text("Leetcode").font(.title)
            Spacer()
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
        Solution51().submit()
    }
}
