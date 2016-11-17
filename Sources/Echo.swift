
struct Echo {
    var options : Any
    let connector : Connector
    
    init(options: Any) {
        self.options = options
        self.connector = nil
    }
    
}

extension Echo {
    
    func listen(channel: String, event: String, callback: ()) -> Channel {
        return connector.channel(channel: channel).listen(event: event, callback: callback)
    }
    
    func channel(channel: String) -> Channel {
        return connector.channel(channel: channel)
    }
    
    func privateChannel(channel: String) -> Channel{
        return connector.privateChannel(channel: channel)
    }
    
    func join(channel: String) -> PresenceChannel {
        return connector.presenceChannel(channel: channel)
    }
    
    func leave(channel: String) {
        connector.leave(channel: channel)
    }
    
    func socketId() -> String {
        return connector.socketId()
    }
}
