struct SFMongo {

    var text = "Hello, World!"
}

public protocol JSONLiteralConvertible {
    init(json: JSON)
}

public protocol BSONStringConvertible {
    var bsonString: String {get}
}

class A {
    private(set) var a: Int = 0
}


func aa() {
    A().a = 1
}
