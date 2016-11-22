import Foundation
import SocketIO

public struct SocketIoConnector : Connector {
    
    public var options: Options
    
    var socket: SocketIOClient
    
    var channels: [String:Any] = [:]
    
    public init(options: Options) {
        self.options = options
        self.socket = SocketIOClient(socketURL: URL(string: "")!)
    }
    
    public func connect() {
        socket.connect()
    }
    
    mutating public func listen(channel: String, event: String, callback: ()) -> Channel {
        return self.channel(name: channel).listen(event: event, callback: callback) as! SocketIoChannel
    }
    
    mutating public func channel(name: String) -> Channel {
        if !(channels[name] != nil) {
            channels[name] = SocketIoChannel(socket: socket, name: name, options: options)
        }
        
        return channels[name] as! SocketIoChannel;
    }
    
    mutating public func privateChannel(name: String) -> Channel {
        return channels["private" + name] as! SocketIoChannel
    }
    
    mutating public func presenceChannel(name: String) -> PresenceChannel {
        return channels["presence" + name] as! PresenceChannel
    }
    
    mutating public func leave(channel: String) {
        
    }
    
    public func socketId() -> String {
        return "";
    }
    
}
