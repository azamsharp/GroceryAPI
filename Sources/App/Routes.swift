import Vapor
import PostgreSQL

extension Droplet {
   
    func setupRoutes() throws {
        
        let postgreSQL =  try PostgreSQL.Database(
            hostname: "localhost",
            database: "grocrydb",
            user: "admin",
            password: "password"
        )
        
        let postgreSQLService = PostgreSQLService(database: postgreSQL)
        
        let shoppingListController = ShoppingListController(service: postgreSQLService)
        shoppingListController.configureRoutes(drop: self)

    }
    
}
