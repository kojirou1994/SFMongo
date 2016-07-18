public protocol JSONLiteralConvertible {
    init(json: JSON) throws
}

public protocol JSONConvertible {
    var json: JSON {get}
}

public protocol SFModel: JSONLiteralConvertible, BSONStringConvertible, JSONConvertible {
    
}

public enum SFMongoError: ErrorProtocol {
    case invalidData
}

