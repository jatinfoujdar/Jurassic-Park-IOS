import SwiftUI

struct PredatorDetailsView: View {
    let predator: ApexPredator
        var body: some View {
            GeometryReader { geo in
            ScrollView{
                ZStack(alignment: .bottomTrailing){
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFill()
                    
                    Image(predator.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width/1.5, height: geo.size.height/3.7)
                        .scaleEffect(x: -1)
                        .shadow(color: .black,radius: 3)
                        .offset(y: 20)
                    
                }

            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    PredatorDetailsView(predator: Predators().apexPredators[1])
        //.preferredColorScheme(.dark)
}
