import SwiftUI

struct ContentView: View {
    let predators = Predators()
    
    @State var searchText = ""
    
    var filterDinos: [ApexPredator]{
        if searchText.isEmpty{
            return predators.apexPredators
        } else {
            return predators.apexPredators.filter { predator in
                predator.name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack{
            List(filterDinos) { predator in
                NavigationLink{
                    
                }label: {
                    HStack {
                        Image(predator.image)
                            .resizable()
                            .scaledToFit()
                            .shadow(color: .white, radius: 1)
                            .frame(width: 100, height: 100)
                        
                        VStack {
                            Text(predator.name)
                                .fontWeight(.bold)
                            
                            Text(predator.type.rawValue.capitalized)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.horizontal, 13)
                                .padding(.vertical, 5)
                                .background(predator.type.background)
                                .clipShape(.capsule)
                        }
                        .padding()
                    }
                }
            }
            .navigationTitle("Apex Predators")
            .searchable(text: $searchText)
            .autocorrectionDisabled()
            .animation(.default, value: searchText)
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
