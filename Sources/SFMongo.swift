public protocol JSONLiteralConvertible {
    init(json: JSON)
}

public protocol JSONConvertible {
    var json: JSON {get}
}

public protocol SFModel: JSONLiteralConvertible, BSONStringConvertible, JSONConvertible {
    
}

public enum SFMongoError: ErrorProtocol {
    case invalidData
}

