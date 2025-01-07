import SwiftUI

struct ApexPredator: Decodable, Identifiable{
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MoviesScenes]
    let link: String
    
    
    var image : String{
        name.lowercased().replacingOccurrences(of: "", with: "")
    }
    
    enum APType: String, Decodable {
        case land
        case air
        case sea
        
        var background: Color {  
            switch self {
            case .land:
                return .brown
            case .sea:
                return .blue
            case .air:
                return .teal
            }
        }
    }

    
   
    
    struct MoviesScenes: Decodable {
        let id: Int
        let movie: String
        let sceneDescriptions: String?
    }
}
