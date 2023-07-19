import SwiftUI

struct ProductImageView: View {
    let urlString: String
    
    var body: some View {
        let https = "https" + urlString.dropFirst(4)
        
        AsyncImage(url: URL(string: https)) { image in
            image
                .resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
}
