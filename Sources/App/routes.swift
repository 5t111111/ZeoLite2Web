import Vapor

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get() { req in
        return try req.view().render("home")
    }

    let locationController = LocationController()
    router.get("location", use: locationController.index)
    router.get("location", String.parameter, use: locationController.show)
}
