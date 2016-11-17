import Foundation

protocol Connector {
    var options : Any { set get }
    
    func connect()
    func channel(channel: String) -> Channel
    func privateChannel(channel: String) -> Channel
    func presenceChannel(channel: String) -> PresenceChannel
    func leave(channel: String)
    func socketId() -> String
}
