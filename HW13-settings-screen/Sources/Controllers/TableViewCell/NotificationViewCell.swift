import UIKit

class NotificationViewCell: UITableViewCell {

    var setting: Settings? {
        didSet {
            settingsImage.image = setting?.settingsImage
            settingsLabel.text = setting?.settingsLabel
        }
    }

    // MARK: - Outlets

    private lazy var settingsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var settingsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var notificationImage: UIImageView = {
        let image = UIImage(named: "notred")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .systemRed
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        return stackView
    }()

    // MARK: - Initializers

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayouts()
        accessoryType = .disclosureIndicator
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Setups

    private func setupHierarchy() {
        addSubview(stackView)
        stackView.addArrangedSubview(settingsImage)
        stackView.addArrangedSubview(settingsLabel)
        contentView.addSubview(notificationImage)
    }

    private func setupLayouts() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.center.equalTo(contentView)
        }
        
        settingsImage.snp.makeConstraints { make in
            make.width.height.equalTo(30)
        }

        notificationImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-45)
            make.width.height.equalTo(30)
        }
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
    
}

