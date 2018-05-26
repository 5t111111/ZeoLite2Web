import Vapor

struct Continent: Content, LocationInformation {
    let code: String?
    let names: [String: String]?
}