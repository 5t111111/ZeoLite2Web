import Vapor

struct Country: Content, LocationInformation {
    let code: String?
    let names: [Name]?
}
