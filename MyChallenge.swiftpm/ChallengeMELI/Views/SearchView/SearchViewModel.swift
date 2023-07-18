import Combine
import Foundation

class SearchViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var products: [Product] = []
    @Published var isShowingProductList = false
    @Published var isShowingAlert = false
    @Published var errorMessage: String? = nil
    
    private var cancellables = Set<AnyCancellable>()
    
    func searchProducts() {
        let baseURL = "https://api.mercadolibre.com/sites/MLA/search"
        let queryParams = "?q=\(searchText)"
        let urlString = (baseURL + queryParams).addingPercentEncoding(
            withAllowedCharacters: .urlQueryAllowed
        ) ?? ""
        
        guard let url = URL(string: urlString) else {
            print("URL invalida")
            return
        }
        
        URLSession.shared.dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: SearchResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Error en la solicitud: \(error.localizedDescription)")
                    self.isShowingAlert = true
                    self.errorMessage = error.localizedDescription
                }
            } receiveValue: { result in
                self.products = result.results
                if result.results.isEmpty {
                    self.isShowingAlert = true
                } else {
                    self.isShowingProductList = true
                }
            }
            .store(in: &cancellables)
    }
}
