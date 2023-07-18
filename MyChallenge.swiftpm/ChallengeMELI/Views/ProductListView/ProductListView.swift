import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            List(viewModel.products) { product in
                NavigationLink(
                    destination: 
                        ProductDetailView()
                        .environmentObject(viewModel)
                ) {
                    VStack(alignment: .leading, spacing: 10) {
                        Text(product.title)
                            .font(.body)
                            .truncationMode(.tail)
                        HStack {
                            Spacer()
                            if product.shipping.free_shipping {
                                Text("Envio gratis")
                                    .font(.caption)
                                    .foregroundColor(Color.accentColor)
                                    .padding(5)
                                    .background(Color.accentColor.opacity(0.2))
                                    .cornerRadius(5)
                                }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}

