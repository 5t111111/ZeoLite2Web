import Vapor
import GraphQL
import ZeoLite2

let QueryType = try! GraphQLObjectType(
    name: "Query",
    fields: [
        "hello": GraphQLField(
            type: GraphQLString,
            resolve: { _, _, _, _ in "world" }
        ),
        "country": GraphQLField(
            type: CountryType,
            args: [
                "ip": GraphQLArgument(
                    type: GraphQLString,
                    description: "IP address"
                )
            ],
            resolve: { _, arguments, context, _ in
                let context = context as! [String: String]
                let remoteIP = context["remoteIP"]!

                let directoryConfig = DirectoryConfig.detect()
                let mmdbPath = "\(directoryConfig.workDir)GeoLite2-Country.mmdb"
                let db = ZeoLite2(mmdbPath)!

                if let ip = arguments["ip"].string {
                    guard let country = db.lookup(ip) else {
                        return Country(code: nil, names: nil)
                    }

                    return Country(code: country.isoCode, names: Name.createNames(from: country.names))
                } else {
                    guard let country = db.lookup(remoteIP) else {
                        return Country(code: nil, names: nil)
                    }

                    return Country(code: country.isoCode, names: Name.createNames(from: country.names))
                }
            }
        ),
    ]
)
