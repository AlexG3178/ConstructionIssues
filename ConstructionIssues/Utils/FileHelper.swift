import Foundation

class FileHelper {
    enum FileError : Error {
        case fileNotInBundle
    }

    private static let FAKE_DATA_LOADING_DELAY_IN_SECONDS = 1.0

    // Receives data list JSON string from service, file or database (implementation specific).
    static func getIssuesJsonString() throws -> String {
        Thread.sleep(forTimeInterval: FAKE_DATA_LOADING_DELAY_IN_SECONDS)

        guard let fileUrl = Bundle.main.url(forResource: "issues", withExtension: "json") else {
            throw FileError.fileNotInBundle
        }
        return try String(contentsOf: fileUrl)
    }
}
