import UIKit

class DepartmentDetailViewController: BaseDepartmentViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: DepartmentDetailHeaderTableViewCell.className, bundle: nil), forCellReuseIdentifier: DepartmentDetailHeaderTableViewCell.className)
    }
    
}

extension DepartmentDetailViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: DepartmentDetailHeaderTableViewCell = tableView.dequeueReusableCell(withIdentifier: DepartmentDetailHeaderTableViewCell.className, for: indexPath) as! DepartmentDetailHeaderTableViewCell
        
        return cell
    }
}
