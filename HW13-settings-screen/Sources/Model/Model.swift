import UIKit

enum SettingsType {
    case standard
    case switcher
    case notification
    case title
    case detail
}

struct Settings: Hashable {
    var settingsImage: UIImage
    var settingsLabel: String
    var type: SettingsType
    var detail: String?
    
}

extension Settings {
    static var settings: [[Settings]] = [
        [Settings(settingsImage: UIImage(named: "1")!, settingsLabel: "Nikita Zhiltsov", type: .title, detail: "Apple ID, iCloud, контент и покупки")],
        
        [Settings(settingsImage: UIImage(named: "flightmode")!, settingsLabel: "Авиарежим", type: .switcher, detail: nil),
         Settings(settingsImage: UIImage(named: "wifi")!, settingsLabel: "Wi-Fi", type: .detail, detail: "Выкл."),
         Settings(settingsImage: UIImage(named: "bluetooth")!, settingsLabel: "Bluetooth", type: .detail, detail: "Выкл."),
         Settings(settingsImage: UIImage(named: "cellular")!, settingsLabel: "Сотовая связь", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "hotspot")!, settingsLabel: "Режим модема", type: .detail, detail: "Выкл."),
         Settings(settingsImage: UIImage(named: "vpn")!, settingsLabel: "VPN", type: .switcher, detail: nil)],
        
        [Settings(settingsImage: UIImage(named: "notification")!, settingsLabel: "Уведомления", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "sound")!, settingsLabel: "Звуки, тактильные сигналы", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "moon")!, settingsLabel: "Фокусирование", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "sandclock")!, settingsLabel: "Экранное время", type: .standard, detail: nil)],
        
        [Settings(settingsImage: UIImage(named: "settings")!, settingsLabel: "Основные", type: .notification, detail: nil),
         Settings(settingsImage: UIImage(named: "switch")!, settingsLabel: "Пункт управления", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "aA")!, settingsLabel: "Экран и яркость", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "home")!, settingsLabel: "Экран домой", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "access")!, settingsLabel: "Универсальный доступ", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "page")!, settingsLabel: "Обои", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "siri")!, settingsLabel: "Siri и Поиск", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "face")!, settingsLabel: "Face ID и код-пароль", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "sos")!, settingsLabel: "Экстренный вызов - SOS", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "covid")!, settingsLabel: "Уведомления о контакте", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "battery")!, settingsLabel: "Аккумулятор", type: .standard, detail: nil),
         Settings(settingsImage: UIImage(named: "private")!, settingsLabel: "Конфиденциальность", type: .standard, detail: nil)]
        ]

}
