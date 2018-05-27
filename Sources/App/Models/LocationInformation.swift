protocol LocationInformation {
    var code: String? { get }
    var names: [Name]? { get }
}

extension LocationInformation {
    func getCodeOnly() -> String {
        guard let code = self.code else {
            return ""
        }

        return code
    }
}