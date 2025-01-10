import SwiftUI
import MapKit

struct PredatorDetailsView: View {
    let predator: ApexPredator
    
    @State var position: MapCameraPosition
    
        var body: some View {
            GeometryReader { geo in
                ScrollView{
                ZStack(alignment: .bottomTrailing){
                    Image(predator.type.rawValue)
                        .resizable()
                        .scaledToFill()
                        .overlay{
                        LinearGradient(stops: [Gradient.Stop (color: .clear, location: 0.8),
                        Gradient.Stop (color: .black, location: 1) ], startPoint: .top, endPoint: .bottom)
                        }
                    
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
                       
                        NavigationLink{
                            Image(predator.image)
                                .resizable()
                                .scaledToFit()
                        }label: {
                            Map(position: $position){
                                Annotation(predator.name, coordinate: predator.location){
                                    Image(systemName: "mappin.and.ellipse")
                                        .font(.largeTitle)
                                        .imageScale(.large)
                                        .symbolEffect(.pulse)
                                }
                                .annotationTitles(.hidden)
                            }
                            .frame(height: 125)
                            .clipShape(.rect(cornerRadius: 15))
                        }
                      
                        
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
                .toolbarRole(.automatic)
        }
    }
}

#Preview {
    let predator = Predators().apexPredators[10]
    PredatorDetailsView(predator: predator, position: .camera(MapCamera(centerCoordinate: predator.location, distance: 30000)))
        .preferredColorScheme(.dark)
}
