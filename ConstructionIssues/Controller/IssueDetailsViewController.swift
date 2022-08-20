//

import Foundation
import UIKit

class IssueDetailsViewController: UIViewController {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var stateLabel: UILabel!
    @IBOutlet weak var createdByLabel: UILabel!
    @IBOutlet weak var assignedToLabel: UILabel!
    @IBOutlet weak var dueDateLabel: UILabel!
    @IBOutlet weak var priorityLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    
    var issue: Issue?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fillWithData()
    }
    
    private func fillWithData() {
        idLabel.text = issue?.ID ?? Constants.emptyString
        subjectLabel.text = issue?.Subject ?? Constants.emptyString
        stateLabel.text = issue?.State ?? Constants.emptyString
        createdByLabel.text = issue?.CreatedBy ?? Constants.emptyString
        assignedToLabel.text = issue?.AssignedTo ?? Constants.emptyString
        dueDateLabel.text = issue?.DueDate ?? Constants.emptyString
        priorityLabel.text = issue?.Priority ?? Constants.emptyString
        descriptionTextView.text = issue?.Description ?? Constants.emptyString
        typeLabel.text = issue?.Type ?? Constants.emptyString
        statusLabel.text = issue?.Status ?? Constants.emptyString
    }
}
