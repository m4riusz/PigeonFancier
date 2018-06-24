import UIKit

class DepartmentDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var title: Label!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.labelStyle = .body(14.0, 5.0)
    }
}

extension DepartmentDetailTableViewCell: DataSourceLoading {
    
    func loadFromData(_ data: Any) {
        if let castedData = data as? [String : Any] {
            title.text = castedData["title"] as? String
            let cellType = castedData["icon"] as! CellType
            accessoryView = UIImageView(image: UIImage(named: cellType.rawValue))
        }
    }
}
