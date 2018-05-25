import Vapor

/// Called after your application has initialized.
public func boot(_ app: Application) throws {
    // your code here
    let directoryConfig = DirectoryConfig.detect()
    let appRootPath = directoryConfig.workDir
    let updateDBCommand = "\(appRootPath)update_database.sh"
    print("=== Database update start (invoking \(updateDBCommand)) ===")
    shell("sh", updateDBCommand)
    print("=== Database update complete ===")
}

@discardableResult
func shell(_ args: String...) -> Int32 {
    let task = Process()
    task.launchPath = "/usr/bin/env"
    task.arguments = args
    task.launch()
    task.waitUntilExit()
    return task.terminationStatus
}
