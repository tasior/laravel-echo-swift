import Foundation
import SocketIO

public struct SocketIoChannel: Channel {
    
    var socket: SocketIOClient
    
    var name: String
    
    public var options: Options
    
    init(socket: SocketIOClient, name: String, options: Options) {
        self.socket = socket
        self.name = name
        self.options = options
        
        
    }
    
    func subscribe() {
        socket.emit("subscribe", ["channel": name, "auth": options.auth])
    }
    
    func unsucscribe() {
        // unbind()
        
        socket.emit("unsubscribe", ["channel": name, "auth": options.auth ])
    }
    
    public func listen(event: String, callback: ()) -> Channel {
        return self;
    }
    
}
