import SwiftUI

struct SuccessView: View {
    @EnvironmentObject var router: Router
    
    let paymentID: String
    
    var body: some View {
        VStack(spacing: 16) {
            Text("Payment ID: \(paymentID)")
            
            Button("⬅️ Pop back") {
                router.pop()
            }
            
            Button("⬅️ ⬅️ Pop to root") {
                router.popToRoot()
            }
        }
        .navigationTitle("Success View")
        .navigationBarTitleDisplayMode(.inline)
    }
}
