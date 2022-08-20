//

import Foundation

enum IssuePriority: String {
    case critical = "1 - Critical"
    case high = "2 - High"
    case medium = "3 - Medium"
    case low = "4 - Low"
}

struct Issue: Codable {
    let ID: String?
    let Subject: String?
    let State: String?
    let Status: String?
    let CreatedBy: String?
    let AssignedTo: String?
    let DueDate: String?
    let Priority: String?
    let Description: String?
    let `Type`: String?
}
