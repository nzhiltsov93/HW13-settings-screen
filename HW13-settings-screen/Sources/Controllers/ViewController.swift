import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var settings = [[Settings]]()

    // MARK: - Outlets

    private lazy var settingsTable: UITableView = {
        let table = UITableView(frame: .zero, style: .grouped)
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Настройки"
        navigationController?.navigationBar.prefersLargeTitles = true
        settings = Settings.settings
        setupHierarchy()
        setupLayouts()
        registerCell()
    }

    // MARK: - Setups

    private func setupHierarchy() {
        view.addSubview(settingsTable)
    }
    
    private func setupLayouts() {
        settingsTable.snp.makeConstraints { make in
            make.top.left.right.bottom.equalTo(view)
        }
    }
    
    private func registerCell() {
        settingsTable.register(SwitchViewCell.self, forCellReuseIdentifier: "switchCell")
        settingsTable.register(NotificationViewCell.self, forCellReuseIdentifier: "notificationCell")
        settingsTable.register(DetailViewCell.self, forCellReuseIdentifier: "detailCell")
        settingsTable.register(StandardViewCell.self, forCellReuseIdentifier: "standardCell")
        settingsTable.register(TitleViewCell.self, forCellReuseIdentifier: "titleCell")
    }
    
}
    
//MARK: - Extension DataSource Delegate

extension ViewController: UITableViewDelegate, UITableViewDataSource {
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let cell = settings[indexPath.section][indexPath.row]
        switch cell.type {
            case .title:
                return 120
            default:
                return 50
        }
    }
        
    func numberOfSections(in tableView: UITableView) -> Int {
        return settings.count
    }
        
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settings[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = settings[indexPath.section][indexPath.row]
        switch cell.type {
        
        case .title:
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! TitleViewCell
            cell.setting = settings[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        case .switcher:
            let cell = tableView.dequeueReusableCell(withIdentifier: "switchCell", for: indexPath) as! SwitchViewCell
            cell.setting = settings[indexPath.section][indexPath.row]
            cell.selectionStyle = .none
            return cell
        case .notification:
            let cell = tableView.dequeueReusableCell(withIdentifier: "notificationCell", for: indexPath) as! NotificationViewCell
            cell.setting = settings[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        case .standard:
            let cell = tableView.dequeueReusableCell(withIdentifier: "standardCell", for: indexPath) as! StandardViewCell
            cell.setting = settings[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        case .detail:
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! DetailViewCell
            cell.setting = settings[indexPath.section][indexPath.row]
            cell.accessoryType = .disclosureIndicator
            return cell
        }
    }
    
}
