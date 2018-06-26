import UIKit

class PigeonViewController: BasePigeonViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyMask: EmptyMaskView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: PigeonTableViewCell.className, bundle: nil), forCellReuseIdentifier: PigeonTableViewCell.className)
        loaderScreen.hide()
        emptyMask.isHidden = true
    }
}

extension PigeonViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PigeonTableViewCell.className, for: indexPath)
        return cell
    }
    
}
