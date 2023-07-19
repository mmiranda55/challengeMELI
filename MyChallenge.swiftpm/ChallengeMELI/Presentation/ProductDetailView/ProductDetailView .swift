import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    @State var selectedProduct: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                ProductImageView(urlString: selectedProduct.thumbnail)
                
                Text(selectedProduct.title)
                    .font(.headline)
                
                QuantityView(selectedProduct: selectedProduct)
                
                PriceView(selectedProduct: selectedProduct)
                
                AdditionalInfoView(selectedProduct: selectedProduct)
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Views

struct QuantityView: View {
    let selectedProduct: Product
    
    var body: some View {
        HStack {
            Text(.available + String(selectedProduct.availableQuantity))
                .font(.caption)
            
            Spacer()
            
            Text(.sold + String(selectedProduct.soldQuantity))
                .font(.caption)
        }
    }
}

struct PriceView: View {
    let selectedProduct: Product
    
    var body: some View {
        HStack {
            Text("$" + NumberUtils.formatNumber(selectedProduct.price))
                .font(.title)
                .bold()
                .foregroundColor(Color.accentColor)
            
            Spacer()
        }
    }
}

struct AdditionalInfoView: View {
    let selectedProduct: Product
    
    var body: some View {
        HStack {
            if selectedProduct.mercadoPagoAvailable {
                Text(.mercadoPagoAvailable)
                    .font(.caption)
                    .foregroundColor(Color.accentColor)
                    .padding(8)
                    .background(Color.accentColor.opacity(0.2))
                    .cornerRadius(8)
            }
            
            Spacer()
            
            if selectedProduct.shipping.freeShipping {
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
