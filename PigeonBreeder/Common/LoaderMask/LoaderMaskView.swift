import UIKit
import NVActivityIndicatorView

protocol LoaderMaskViewProtocol {
    
    func onRefresh() -> Void
    
}

class LoaderMaskView: NibView {

    @IBOutlet weak var activityIndicator: NVActivityIndicatorView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: Label!
    @IBOutlet weak var descriptionLabel: Label!
    @IBOutlet weak var tryAgainButton: Button!
    
    var delegate: LoaderMaskViewProtocol?
    
    override func commonInit() {
        super.commonInit()
        titleLabel.labelStyle = .bodyBold(16.0, 5.0)
        descriptionLabel.labelStyle = .capition(14.0, 5.0)
        tryAgainButton.buttonStyle = .actionLink
        activityIndicator.type = .ballRotateChase
    }
    
    func show() -> Void {
        self.isHidden = false
        activityIndicator.isHidden = false;
        imageView.isHidden = true
        titleLabel.isHidden = false
        descriptionLabel.isHidden = false
        tryAgainButton.isHidden = true
        activityIndicator.startAnimating()
        titleLabel.text = LocalizableStrings.dataDownloadTitle.localized
        descriptionLabel.text = LocalizableStrings.dataDownloadDescription.localized
        self.superview?.bringSubview(toFront: self)
    }
    
    func hide() -> Void {
        self.isHidden = true
        activityIndicator.stopAnimating();
        self.superview?.sendSubview(toBack: self)
    }
    
    func error(error: Error? = nil) -> Void {
        self.isHidden = false
        activityIndicator.isHidden = true;
        imageView.isHidden = false
        titleLabel.isHidden = false
        descriptionLabel.isHidden = false
        tryAgainButton.isHidden = false
        activityIndicator.stopAnimating()
        imageView.tintColor = Config.Color.error
        titleLabel.text = LocalizableStrings.error.localized
        descriptionLabel.text = LocalizableStrings.tryAgainLater.localized
        tryAgainButton.title = LocalizableStrings.dataDownloadTryAgain.localized
        self.superview?.bringSubview(toFront: self)
    }
    
    // MARK- Actions
    
    @IBAction func onTryAgainButton(_ sender: Any) {
        delegate?.onRefresh()
    }
    
}
