import Foundation

protocol Channel {
    var options : Any { get set }
    
    func listen(event: String, callback: ()) -> Channel
}

extension Channel {
    func notification(callback: ()) -> Channel {
        return listen(event: ".Illuminate.Notifications.Events.BroadcastNotificationCreated", callback: callback)
    }
}