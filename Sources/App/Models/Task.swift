//
//  Task.swift
//  GroceryAPI
//
//  Created by Mohammad Azam on 6/1/17.
//
//

import Foundation
import HTTP
import Vapor

struct Task {
    var title :String
}

extension Task : JSONConvertible {
    
    init(json: JSON) throws {
        
        guard let title = json["title"]?.string else {
            fatalError("Missing parameters")
        }
        
        self.title = title
    }
    
    init(node :Node) {
        
        guard let title = node["title"]?.string else {
            fatalError("Missing parameters")
        }
        
        self.title = title
    }
    
    func makeJSON() throws -> JSON {
        
        var json = JSON()
        try json.set("title", self.title)
        return json
    }
    
}
