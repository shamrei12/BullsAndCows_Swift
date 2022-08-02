
import Foundation

class TimeManager {
    
    static var shared: TimeManager = {
        let instance = TimeManager()
        return instance
    }()
    
    private init() {}
    
    func convertToMinutes(seconds: Int) -> String {
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .full
        
        let formattedString = formatter.string(from: TimeInterval(seconds))!
        return formattedString
    }
}
