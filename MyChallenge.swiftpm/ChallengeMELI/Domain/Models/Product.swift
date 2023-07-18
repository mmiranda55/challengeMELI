import SwiftUI

struct Product: Codable, Identifiable {
    let id: String
    let title: String
    let price: Double
    let shipping: Shipping
    let availableQuantity: Double
    let soldQuantity: Double
    let condition: String
    let attributes: [ProductDetail]
    
    enum CodingKeys: String, CodingKey {
        case id
        case condition
        case title
        case price
        case shipping
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
    struct ProductDetail: Codable {
        let name: String? = ""
        let value: String? = ""
        
        enum CodingKeys: String, CodingKey {
            case name
            case value = "value_name"
        }
    }
}
