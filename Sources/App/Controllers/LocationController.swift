import Vapor
import MMDB

final class LocationController {
    var mmdb: MMDB? {
        get {
            let directoryConfig = DirectoryConfig.detect()
            let mmdbPath = "\(directoryConfig.workDir)GeoLite2-Country.mmdb"

            guard let db = MMDB(mmdbPath) else {
                return nil
            }

            return db
        }
    }

    func show(_ req: Request) throws -> Future<Location> {
        guard let ip = try? req.parameters.next(String.self) else {
            throw Abort(.unprocessableEntity)
        }

        return Future.map(on: req) {
            guard let db = self.mmdb else {
                throw Abort(.internalServerError)
            }

            guard let country = db.lookup(ip) else {
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
}
