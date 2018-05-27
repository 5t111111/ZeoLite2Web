import Vapor
import GraphQL

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    router.get() { req in
        return try req.view().render("home")
    }

    let locationController = LocationController()
    router.get("location", use: locationController.index)
    router.get("location", String.parameter, use: locationController.show)

    router.post("graphql") { req -> Future<String> in
        guard let remoteIPs = req.http.remotePeer.hostname else {
            throw Abort(.unprocessableEntity)
        }

        let query = try req.content.syncGet(String.self, at: "query")
        let remoteIP = remoteIPs.components(separatedBy: ",")[0]

        return Future.map(on: req) {
            let result = try graphql(schema: Schema, request: query, contextValue: ["remoteIP": remoteIP])
//            let headers: HTTPHeaders = ["content-type": "application/json; charset=utf-8"]
//            let res = Response(http: .init(headers: headers, body: result.description), using: req.sharedContainer)
//            return req.sharedContainer.eventLoop.newSucceededFuture(result: res)
            return result.description
        }
    }
}
