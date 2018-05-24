import Vapor

struct Location: Content {
    let ip: String
    let countryCode: String?
    let countryNames: [String: String]?
}
