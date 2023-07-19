import SwiftUI

struct SearchView: View {
    @EnvironmentObject private var viewModel: SearchViewModel
    
    var body: some View {
        ZStack(alignment: .center) {
            NavigationStack {
                VStack {
                    Text(.titleSearch)
                        .padding()
                        .font(.headline)
                        .foregroundColor(Color.accentColor)
                    
                    SearchBar(text: $viewModel.searchText,
                              onSearch: viewModel.searchProducts)
                    
                    NavigationLink(
                        destination:
                            ProductListView()
                            .environmentObject(viewModel),
                        isActive: $viewModel.isShowingProductList,
                        label: { EmptyView() })
                }
            }
            if viewModel.isShowingAlert {
                AlertView(isActive: $viewModel.isShowingAlert, 
                          title: .errorTitle,
                          message: viewModel.errorMessage ?? .errorMessage,
                          buttonTitle: .accept)
                .transition(AnyTransition.opacity.animation(.easeInOut))
            }
        }
    }
}

// MARK: - Views
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
