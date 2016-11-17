import Foundation

protocol Formatter {
    func format(event: String) -> String
}

struct EventFormater {
    var namespace : String?
    
    init(namespace: String? = nil) {
        self.namespace = namespace
    }
}

extension EventFormater: Formatter {
    func format(event: String) -> String {
        var event = event
        
        if let namespace = namespace {
            if event.characters.first != "\\" && event.characters.first != "." {
                event = namespace + "." + event
            } else {
                event.remove(at: event.startIndex)
            }
        }
        
        return event.replacingOccurrences(of: ".", with: "\\")
    }
}

extension String {
    func format(with eventFormatter: Formatter) -> String {
        return eventFormatter.format(event: self)
    }
}
