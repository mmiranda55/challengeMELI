import SwiftUI

struct ProductDetailView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    @State var selectedProduct: Product
    
    var body: some View {
        ZStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 16) {
                let http = selectedProduct.thumbnail
                let https = "https" + http.dropFirst(4)
                    
                AsyncImage(url: URL(string: https)) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(width: 100, height: 100)
                
                Text(selectedProduct.title)
                    .font(.headline)
                
                HStack {
                    Text(.available + String(selectedProduct.availableQuantity))
                        .font(.caption)
                    
                    Spacer()
                    
                    Text(.sold + String(selectedProduct.soldQuantity))
                        .font(.caption)
                }
                        
                    HStack {
                        Text("$" + NumberUtils.formatNumber(selectedProduct.price))
                            .font(.title)
                            .bold()
                            .foregroundColor(Color.accentColor)
                            
                            Spacer()
                            
                    }
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
                
                Spacer()
            }
            .padding()
       }
    }
}
