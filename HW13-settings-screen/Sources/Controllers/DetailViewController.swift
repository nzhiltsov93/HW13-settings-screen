import UIKit
import SnapKit

class DetailViewController: UIViewController {

    var setting: Settings?
    
//MARK: - Outlets
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
//MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        setupHierarhy()
        fillSettingsDetail()
        setupLayot()
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        view.addSubview(label)
        view.addSubview(image)
    }
    
    private func setupLayot() {
        image.snp.makeConstraints { make in
            make.centerY.centerX.equalTo(view)
            make.width.height.equalTo(50)
        }
        label.snp.makeConstraints { make in
            make.centerX.equalTo(view)
            make.top.equalTo(image.snp.bottom).offset(30)
        }
    }
    
    private func fillSettingsDetail() {
        image.image = setting?.settingsImage
        label.text = "Это - \(setting?.settingsLabel ?? "")"
    }

}
