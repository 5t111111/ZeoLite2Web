import Vapor

struct Name: Content {
    let locale: String
    let value: String

    static func createNames(from dict: [String: String]) -> [Name] {
        var names: [Name] = []
        for (key, value) in dict {
            names.append(Name(locale: key, value: value))
        }
        return names
    }
}
