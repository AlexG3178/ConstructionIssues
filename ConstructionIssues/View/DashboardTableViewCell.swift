//

import Foundation
import UIKit

class DashboardTableViewCell: UITableViewCell {
    
    @IBOutlet weak var criticalImage: UIImageView!
    @IBOutlet weak var subjectLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var expandButton: UIButton!
    @IBOutlet weak var criticalImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var subjectToImageLeadingConstraint: NSLayoutConstraint!
    
    typealias arrowButtonTappedBlock = () -> Void
    var arrowButtonTapped: arrowButtonTappedBlock!
    var isExpanded: Bool = false
    
    @IBAction func onExpandBtnClick(_ sender: Any) {
        
        if arrowButtonTapped != nil {
            arrowButtonTapped()
        }
    }
    
    func fillWithData(issue: Issue) {
        
        let expandImage = UIImage(named: "expandImage")
        subjectLabel.text = issue.Subject ?? Constants.emptyString
        descriptionLabel.text = issue.Description ?? Constants.emptyString
        if issue.Priority == IssuePriority.critical.rawValue {
            criticalImage.image = UIImage(named: "criticalImage")
            criticalImageWidthConstraint.constant = Constants.criticalImageSize
            subjectToImageLeadingConstraint.constant = 10
        } else {
            criticalImage.image = nil
            criticalImageWidthConstraint.constant = 0
            subjectToImageLeadingConstraint.constant = 0
        }
        if isExpanded {
            descriptionLabel.numberOfLines = descriptionLabel.rowsNumber()
            dateLabel.text = issue.DueDate ?? Constants.emptyString
            if let expandImage = expandImage, let cgExpandImage = expandImage.cgImage {
                let collapseImage = UIImage(cgImage: cgExpandImage, scale: UIScreen.main.scale, orientation: .downMirrored)
                expandButton.setImage(collapseImage, for: .normal)
            }
        } else {
            descriptionLabel.numberOfLines = 1
            dateLabel.text?.removeAll()
            expandButton.setImage(expandImage, for: .normal)
        }
    }
}
