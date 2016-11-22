import Foundation

public protocol Channel {
    var options : Options { get set }
    
    func listen(event: String, callback: ()) -> Channel
}

public extension Channel {
    func notification(callback: ()) -> Channel {
        return listen(event: ".Illuminate.Notifications.Events.BroadcastNotificationCreated", callback: callback)
    }
}
