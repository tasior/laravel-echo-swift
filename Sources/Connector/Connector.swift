import Foundation

enum Connectors {
    case socketio
}

struct Options {
    var auth:[String:[String:String]]
    var authEndpoint: String
    var connector: Connectors
    var csrfToken: String?
    var host: String?
    var namespace: String?
    
    init(
        connector: Connectors,
        auth:[String:[String:String]] = ["headers": [:]],
        authEndpoint:String = "/broadcasting/auth",
        csrfToken: String? = nil,
        host: String? = nil,
        namespace: String? = nil
         ) {
        self.auth = auth
        self.authEndpoint = authEndpoint
        self.connector = connector
        self.csrfToken = csrfToken
        self.host = host
        self.namespace = namespace
    }
    
    
}

protocol Connector {
    var options : Options { get set }
    
    init(options: Options)
    
    func connect()
    mutating func listen(channel: String, event: String, callback: ()) -> Channel
    mutating func channel(name: String) -> Channel
    mutating func privateChannel(name: String) -> Channel
    mutating func presenceChannel(name: String) -> PresenceChannel
    mutating func leave(channel: String)
    func socketId() -> String
}

struct ConnectorFactory {
    
    static func create(type: Connectors, options: Options) -> Connector {
        switch type {
        case .socketio:
            return SocketIoConnector(options: options)
        }
    }
    
}
