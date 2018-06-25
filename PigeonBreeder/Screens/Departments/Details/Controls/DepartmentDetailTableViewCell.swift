import UIKit

enum DepartmentDetailTableViewCellType: String {
    case none = ""
    case map = "ic_gps"
    case phone = "ic_phone"
    case email = "ic_email"
}

struct DepartmentDetailTableViewCellData {
    let title: String
    let type: DepartmentDetailTableViewCellType
}

class DepartmentDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var title: Label!
    private var data: DepartmentDetailTableViewCellData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        title.labelStyle = .body(14.0, 5.0)
    }
    
    override func prepareForReuse() {
        self.data = nil
    }
}

extension DepartmentDetailTableViewCell: DataSourceLoading {
    
    func loadFromData(_ data: Any) {
        if let castedData = data as? DepartmentDetailTableViewCellData {
            self.data = castedData
            title.text = castedData.title
            accessoryView = UIImageView(image: UIImage(named: castedData.type.rawValue))
        }
    }
}
