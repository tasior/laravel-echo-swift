import Foundation
import SocketIO

public struct SocketIoConnector : Connector {
    
    var options: Options
    
    var socket: SocketIOClient
    
    var channels: [String:Any] = [:]
    
    init(options: Options) {
        self.options = options
        self.socket = SocketIOClient(socketURL: URL(string: "")!)
    }
    
    func connect() {
        socket.connect()
    }
    
    mutating func listen(channel: String, event: String, callback: ()) -> Channel {
        return self.channel(name: channel).listen(event: event, callback: callback) as! SocketIoChannel
    }
    
    mutating func channel(name: String) -> Channel {
        if !(channels[name] != nil) {
            channels[name] = SocketIoChannel(socket: socket, name: name, options: options)
        }
        
        return channels[name] as! SocketIoChannel;
    }
    
    mutating func privateChannel(name: String) -> Channel {
        return channels["private" + name] as! SocketIoChannel
    }
    
    mutating func presenceChannel(name: String) -> PresenceChannel {
        return channels["presence" + name] as! PresenceChannel
    }
    
    mutating func leave(channel: String) {
        
    }
    
    func socketId() -> String {
        return "";
    }
    
}
