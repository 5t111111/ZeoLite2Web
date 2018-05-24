import Vapor
import MMDB

/// Register your application's routes here.
public func routes(_ router: Router) throws {
    // Basic "Hello, world!" example
    router.get("hello") { req in
        return "Hello, world!"
    }

    router.get("json", String.parameter) { req -> Location in
        guard let ip = try? req.parameters.next(String.self) else { throw Abort(.unprocessableEntity) }

        let directoryConfig = DirectoryConfig.detect()
        let mmdbPath = "\(directoryConfig.workDir)Public/GeoLite2-Country.mmdb"

        guard let db = MMDB(mmdbPath) else { throw Abort(.internalServerError) }

        guard let country = db.lookup("185.253.97.56") else {
            return Location(
                ip: ip,
                countryCode: nil,
                countryNames: nil
            )
        }

        return Location(
            ip: ip,
            countryCode: country.isoCode,
            countryNames: country.names
        )
    }
}
