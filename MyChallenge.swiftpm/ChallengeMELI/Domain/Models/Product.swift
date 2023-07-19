import SwiftUI

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let mercadoPagoAvailable: Bool
    let shipping: Shipping
    let availableQuantity: Int
    let soldQuantity: Int
    let thumbnail: String
    let attributes: [ProductDetail]
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case shipping
        case mercadoPagoAvailable = "accepts_mercadopago"
        case thumbnail
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case attributes
    }
}

extension Product {
    struct Shipping: Codable {
        var freeShipping: Bool
        
        enum CodingKeys: String, CodingKey {
            case freeShipping = "free_shipping"
        }
    }
}

extension Product {
    struct ProductDetail: Codable, Identifiable {
        let id: String
        let name: String = ""
        let value: String = ""
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case value = "value_name"
        }
    }
}
