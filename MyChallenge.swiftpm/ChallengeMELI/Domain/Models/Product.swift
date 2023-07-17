import SwiftUI

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let thumbnail: String
    let shipping: Shipping
}

extension Product {
    struct Shipping: Codable {
        var free_shipping: Bool
    }
}
