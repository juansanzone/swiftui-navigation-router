import SwiftUI

struct DetailView: View {
    
    @EnvironmentObject var router: Router
    
    var body: some View {
        VStack(spacing: 16) {
            Button("Push success screen") {
                router.push(screen: .successView(paymentID: "123"))
            }
        }
        .navigationTitle("Detail View")
        .navigationBarTitleDisplayMode(.inline)
    }
}
