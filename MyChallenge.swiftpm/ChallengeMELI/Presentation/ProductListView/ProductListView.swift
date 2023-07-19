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
                    ProductListItemView(product: product)
                }
            }
        }
    }
}

struct ProductListItemView: View {
    let product: Product
    
    var body: some View {
        HStack {
            ProductImageView(urlString: product.thumbnail)
            
            VStack(alignment: .leading, spacing: 16) {
                Text(product.title)
                    .font(.body)
                    .truncationMode(.tail)
                
                PriceAndShippingView(product: product)
            }
        }
        .padding()
    }
}

struct PriceAndShippingView: View {
    let product: Product
    
    var body: some View {
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
