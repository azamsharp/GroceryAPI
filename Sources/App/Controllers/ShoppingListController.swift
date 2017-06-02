//
//  ShoppingListController.swift
//  GroceryAPI
//
//  Created by Mohammad Azam on 5/31/17.
//
//

import Foundation
import HTTP
import Vapor
import PostgreSQL

final class ShoppingListController {
    
    private var postgreSQLService :PostgreSQLService
    
    init(service :PostgreSQLService) {
        self.postgreSQLService = service
    }
    
    func configureRoutes(drop :Droplet) {
        
        drop.get("shoppinglists",handler :index)
    }
    
    func index(request :Request) throws -> ResponseRepresentable {
        
        return try self.postgreSQLService.getAllShoppingLists().makeJSON()
    }

}


