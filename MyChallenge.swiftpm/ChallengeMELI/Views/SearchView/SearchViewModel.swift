import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var products: [Product] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchProducts() {
        let baseURL = "https://api.mercadolibre.com/sites/MLA/search"
        let queryParams = "?q=\(searchText)"
        let urlString = baseURL + queryParams
        
        guard let url = URL(string: urlString) else {
            print("URL invalida")
            return
        }
        
    }
}
