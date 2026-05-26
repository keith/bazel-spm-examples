import CoreGraphics
import CoreLocation
import MapboxMaps

public enum MapboxMapsExample {
    public static func makeCameraOptions(
        latitude: CLLocationDegrees,
        longitude: CLLocationDegrees,
        zoom: CGFloat
    ) -> CameraOptions {
        CameraOptions(
            center: CLLocationCoordinate2D(latitude: latitude, longitude: longitude),
            zoom: zoom
        )
    }

    public static func streetsStyle() -> StyleURI {
        .streets
    }
}
