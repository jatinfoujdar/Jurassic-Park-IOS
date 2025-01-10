import SwiftUI
import MapKit

struct PredatorMap: View {
    @State var position : MapCameraPosition
    var body: some View {
        Map(position: $position)
    }
}

#Preview {
    PredatorMap(position: .camera(MapCamera(centerCoordinate: Predators().apexPredators[10].location, distance: 1000, heading: 250, pitch: 80)))
}
