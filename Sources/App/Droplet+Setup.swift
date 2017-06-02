@_exported import Vapor

import PostgreSQL

extension Droplet {
    
    public func setup() throws {
       
        try setupRoutes()
    }
}
