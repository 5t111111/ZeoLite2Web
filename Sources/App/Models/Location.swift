import Vapor

struct Location: Content {
    let ip: String
    let country: Country?
    let continent: Continent?
}
