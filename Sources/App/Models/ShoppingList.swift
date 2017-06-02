import Vapor
import FluentProvider
import HTTP

struct ShoppingList {
    
    var title :String
}

extension ShoppingList {
    
    init(node :Node) {
        
        guard let title = node["title"]?.string else {
            fatalError("Incorrect parameters")
        }
        
        self.title = title
    }
}

extension ShoppingList: JSONConvertible {
   
    init(json: JSON) throws {
        try self.init(
            title: json.get("title")
        )
    }
    
    func makeJSON() throws -> JSON {
        var json = JSON()
        try json.set("title", self.title)
        return json
    }
}

extension ShoppingList: ResponseRepresentable { }
