import UIKit
import SnapKit

class SwitchViewCell: UITableViewCell {
    
    var setting: Settings? {
        didSet {
            setingsImage.image = setting?.settingsImage
            settingsLabel.text = setting?.settingsLabel
        }
    }
    
    //MARK: - Outlets
        
    private lazy var setingsImage: UIImageView = {
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
        
    private lazy var switchButton: UISwitch = {
        let switchButton = UISwitch()
        return switchButton
    }()
    
    private lazy var stackView: UIStackView = {
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
    
    private func setupHierarhy() {
        stackView.addArrangedSubview(setingsImage)
        stackView.addArrangedSubview(settingsLabel)
        addSubview(stackView)
        contentView.addSubview(switchButton)
    }
    
    private func setupLayout() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.left.equalTo(contentView).offset(10)
            make.center.equalTo(contentView)
        }
        
        setingsImage.snp.makeConstraints { make in
            make.height.width.equalTo(30)
        }
        
        switchButton.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(10)
            make.right.equalTo(self).offset(-20)
        }
        
    }
    
// MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
        self.setting = nil
    }
}

