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
                    VStack(alignment: .leading){
                        Text(predator.name)
                            .font(.largeTitle)
                       
                        
                        Text("Appears in:")
                            .font(.title3)
                        
                        
                        ForEach(predator.movies, id: \.self){movie in
                            Text("∙" + movie)
                                .font(.subheadline)
                        }
                        
                        Text("Movie Moments")
                            .font(.title)
                            .padding(.top,15)
                        
                        ForEach(predator.movieScenes){scene in
                            Text(scene.movie)
                                .font(.title2)
                                .padding(.vertical, 1)
                            
                            Text(scene.sceneDescription ?? "No description available")
                            .padding(.bottom, 15)
                        }
                        Text("Read More:")
                            .font(.caption)
                        
                        Link(predator.link, destination:  URL(string: predator.link)!)
                    }
                    .padding()
                    .padding(.bottom)
                    .frame(width: geo.size.width, alignment: .leading)
                   
            }
                .ignoresSafeArea(.all)
        }
    }
}

#Preview {
    PredatorDetailsView(predator: Predators().apexPredators[1])
        //.preferredColorScheme(.dark)
}
