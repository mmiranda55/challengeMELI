import SwiftUI

struct ProductListView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    
    var body: some View {
        ZStack(alignment: .top) {
            List(viewModel.products) { product in
                NavigationLink(
                    destination: 
                        ProductDetailView(selectedProduct: product)
                        .environmentObject(viewModel)
                ) {
                    HStack {
                        let http = product.thumbnail
                        let https = "https" + http.dropFirst(4)
                        
                        AsyncImage(url: URL(string: https)) { image in
                            image
                                .resizable()
                                .scaledToFit()
                        } placeholder: {
                            ProgressView()
                        }
                        .frame(width: 100, height: 100)
                        
                        VStack(alignment: .leading, spacing: 16) {
                            Text(product.title)
                                .font(.body)
                                .truncationMode(.tail)
                            HStack {
                                Text("$" + NumberUtils.formatNumber(product.price))
                                    .font(.headline)
                                Spacer()
                                if product.shipping.freeShipping {
                                    Text(.freeShipping)
                                        .font(.caption)
                                        .foregroundColor(Color.accentColor)
                                        .padding(8)
                                        .background(Color.accentColor.opacity(0.2))
                                        .cornerRadius(8)
                                }
                            }
                        }
                    }
                    .padding()
                }
            }
        }
    }
}
