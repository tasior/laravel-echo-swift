import Foundation

struct Echo {
    var connector : Connector
    
    init(options: Options) {
        self.connector = ConnectorFactory.create(type: options.connector, options: options)
        self.connector.connect()
    }
}

extension Echo {
    mutating func listen(channel: String, event: String, callback: ()) -> Channel {
        return connector.listen(channel: channel, event: event, callback: callback)
    }
    
    mutating func channel(channel: String) -> Channel {
        return connector.channel(name: channel)
    }
    
    mutating func privateChannel(channel: String) -> Channel{
        return connector.privateChannel(name: channel)
    }
    
    mutating func join(channel: String) -> PresenceChannel {
        return connector.presenceChannel(name: channel)
    }
    
    mutating func leave(channel: String) {
        connector.leave(channel: channel)
    }
    
    func socketId() -> String {
        return connector.socketId()
    }
}
