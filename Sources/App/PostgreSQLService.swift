//
//  PostgreSQLService.swift
//  GroceryAPI
//
//  Created by Mohammad Azam on 6/1/17.
//
//

import Foundation
import Vapor
import HTTP
import PostgreSQL

class PostgreSQLService {
    
    private var database :PostgreSQL.Database
    
    init(database :PostgreSQL.Database) {
        
        self.database = database 
    }
    
    func getAllShoppingLists() throws -> [ShoppingList] {
        
        var shoppingLists = [ShoppingList]()
        let connection = try self.database.makeConnection()
        let result = try connection.execute("select * from shoppinglists")
        try connection.close()
        
        guard let nodeArray = result.array else {
            return shoppingLists
        }
        
        for node in nodeArray {
            
            let shoppingList = ShoppingList(node: node)
            shoppingLists.append(shoppingList)
        }
        
        return shoppingLists
    }
    
}

