//

import Foundation
import UIKit
import ProgressHUD


// autolayout for heightForRowAt instead of tableView.cellForRow(at: indexPath)

class DashboardViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var issuesList: [Issue] = []
    private var selectedIndexes: [Int] = []
    var selectedRowsHeight: [Int : CGFloat] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "My work"
        tableView.delegate = self
        tableView.dataSource = self
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.colorAnimation = .systemGreen
        ProgressHUD.colorHUD = UIColor.clear
        ProgressHUD.show()
        
        DispatchQueue.global(qos: .userInteractive).async {
            self.fetchData()
        }
    }
    
    private func fetchData() {
        
        do {
            let decoder = JSONDecoder()
            var issuesListString = String()
            try issuesListString = FileHelper.getIssuesJsonString()
            let data = Data(issuesListString.utf8)
            issuesList = try decoder.decode([Issue].self, from: data)
        } catch {
            print("fetch error")
        }
        DispatchQueue.main.async {
            self.tableView.reloadData()
            ProgressHUD.dismiss()
        }
    }
    
    // MARK: - DashboardCellDelegate
    func expandButtonTapped(_ cell: DashboardTableViewCell) {
        
        if let index = tableView.indexPath(for: cell) {
            tableView.reloadRows(at: [index], with: .none)
        }
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return issuesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.dashboardCellIdentifier) as? DashboardTableViewCell else {
            return UITableViewCell()
        }
        
        cell.arrowButtonTapped = { () -> Void in
            
            if self.selectedIndexes.contains(indexPath.row), let index = self.selectedIndexes.firstIndex(of: indexPath.row) {
                self.selectedIndexes.remove(at: index)
            } else {
                self.selectedIndexes.append(indexPath.row)
            }
            self.tableView.beginUpdates()
            self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
            self.tableView.endUpdates()
        }
        
        cell.isExpanded = selectedIndexes.contains(indexPath.row)
        cell.fillWithData(issue: issuesList[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        if selectedIndexes.contains(indexPath.row) {
            if tableView.isDragging {
                if let rowHeight = selectedRowsHeight[indexPath.row] {
                    return rowHeight
                }
            } else {
                if let cell = tableView.cellForRow(at: indexPath) as? DashboardTableViewCell {
                    let rowsNumber = CGFloat(cell.descriptionLabel.rowsNumber())
                    let rowHeight = Constants.cellHeight + rowsNumber * Constants.textRowHeight + Constants.textRowHeight
                    selectedRowsHeight[indexPath.row] = rowHeight
                    return rowHeight
                }
            }
        }
        return Constants.cellHeight
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let issueDetailsViewController = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: Constants.issueDetailsViewController) as? IssueDetailsViewController else { return }
        
        issueDetailsViewController.issue = issuesList[indexPath.row]
        self.navigationController?.present(issueDetailsViewController, animated: true, completion: nil)
    }
}
