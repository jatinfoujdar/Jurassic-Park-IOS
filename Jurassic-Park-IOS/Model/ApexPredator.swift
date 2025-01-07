import SwiftUI

struct ApexPredator: Decodable, Identifiable{
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MoviesScenes]
    let link: String
    
    
    var image : String{
        name.lowercased().replacingOccurrences(of: "", with: "")
    }
    
    enum APType{
        case land
        case air
        case sea
        
        
        var backgronund : Color{
            switch self {
            case .land:
                    .brown
            case .sea:
                    .blue
            case .air:
                    .teal
                
            }
        }
    }
    
   
    
    struct MoviesScenes: Decodable {
        let id: Int
        let movie: String
        let sceneDescriptions: String?
    }
}
