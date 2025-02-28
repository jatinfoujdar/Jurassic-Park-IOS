import SwiftUI
import MapKit

struct ApexPredator: Decodable, Identifiable{
    let id: Int
    let name: String
    let type: APType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MoviesScenes]
    let link: String
    
    
    var location: CLLocationCoordinate2D{
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    var image : String{
        name.lowercased().replacingOccurrences(of: "", with: "")
    }
    
    
    struct MoviesScenes: Decodable,Identifiable {
        let id: Int
        let movie: String
        let sceneDescription: String?
    }
}


enum APType: String, Decodable, CaseIterable, Identifiable {
    var id: APType{
        self
    }
    
    case all
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
        case .all:
            return .black
        }
    }
    var icon: String{
        switch self{
        case .all:
            "square.stack.3d.up.fill"
        case .air:
            "wind"
        case .land:
            "leaf.fill"
        case .sea:
            "drop.fill"
        }
    }
}
