import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let locationController = LocationController()
    router.get("location", use: locationController.index)
    router.get("location", String.parameter, use: locationController.show)
}
