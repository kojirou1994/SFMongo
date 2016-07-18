public protocol JSONLiteralConvertible {
    init(json: JSON)
}

public protocol BSONStringConvertible {
    var bsonString: String {get}
}

public protocol JSONConvertible {
    var json: JSON {get}
}

public protocol SFModel: JSONLiteralConvertible, BSONStringConvertible, JSONConvertible {
    
}
