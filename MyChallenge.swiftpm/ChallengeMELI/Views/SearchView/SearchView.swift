import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                NavigationLink(
                    destination:
                        ProductListView()
                        .environmentObject(viewModel),
                    isActive: $viewModel.isShowingProductList,
                    label: { EmptyView() })
                
                Text("¿Buscando algo en particular?")
                    .font(.headline)
                    .foregroundColor(Color.accentColor)
                    .padding()
                SearchBar(text: $viewModel.searchText,
                          onSearch: viewModel.searchProducts)
            }
        }
    }
}

struct SearchBar: View {
    @Binding var text: String
    var onSearch: () -> Void
    
    var body: some View {
        HStack {
            TextField("Buscar...", text: $text)
                .onSubmit(onSearch)
            Image(systemName: "xmark.circle.fill")
                .foregroundColor(Color.accentColor)
                .opacity(text.isEmpty ? 0.0 : 1.0)
                .onTapGesture {
                    text = ""
                }
            Image(systemName: "magnifyingglass")
                .foregroundColor(text.isEmpty ? Color.secondary : Color.accentColor)
        }
        .font(.body)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .stroke(text.isEmpty ? Color.secondary : Color.accentColor)
        )
        .padding()
    }
}
