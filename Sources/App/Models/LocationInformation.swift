protocol LocationInformation {
    var code: String? { get }
    var names: [String: String]? { get }
}

extension LocationInformation {
    func getCodeOnly() -> String {
        guard let code = self.code else {
            return ""
        }

        return code
    }
}