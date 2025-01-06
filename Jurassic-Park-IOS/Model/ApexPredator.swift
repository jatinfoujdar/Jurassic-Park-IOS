import Foundation

struct ApexPredator{
    let id: Int
    let name: String
    let type: String
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MoviesScenes]
    let link: String
    
    struct MoviesScenes{
        let id: Int
        let movie: String
        let sceneDescriptions: String
    }
}
