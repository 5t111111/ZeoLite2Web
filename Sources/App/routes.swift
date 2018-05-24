import Vapor
import MMDB

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    let locationController = LocationController()
    router.get("json", String.parameter, use: locationController.show)
}
