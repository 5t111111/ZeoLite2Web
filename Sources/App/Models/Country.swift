import Vapor

struct Country: Content {
    let code: String?
    let names: [String: String]?
}
