import UIKit
import SnapKit

class DetailViewCell: UITableViewCell {

    var setting: Settings? {
        didSet {
            settingsImage.image = setting?.settingsImage
            settingsLabel.text = setting?.settingsLabel
            detailLabel.text = setting?.detail
        }
    }

//MARK: - Outlets
    
    private lazy var settingsImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private lazy var detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    private var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()
    
//MARK: - Initializers
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarhy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//MARK: - Setup
    
    private func setupHierarhy() {
        stackView.addArrangedSubview(settingsImage)
        stackView.addArrangedSubview(settingsLabel)
        addSubview(stackView)
        contentView.addSubview(detailLabel)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.center.equalTo(contentView)
        }
        settingsImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(15)
            make.right.equalTo(self).offset(-40)
        }
    }
    
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
    
}
