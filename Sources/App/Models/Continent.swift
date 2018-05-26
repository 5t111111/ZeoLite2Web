import Vapor

struct Continent: Content {
    let code: String?
    let names: [String: String]?
}