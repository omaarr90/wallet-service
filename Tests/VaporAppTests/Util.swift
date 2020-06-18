//
//  Util.swift
//  VaporApp
//
//  Created by عمر سعيد الشمري on 18/06/2020.
//

import Fluent
import Vapor
import XCTest

@testable import VaporApp

func setup(_ environment: Environment) throws -> Application {    
    let app = Application(.testing)
    app.logger.logLevel = Environment.get("LOG_LEVEL").flatMap(Logger.Level.init(rawValue:)) ?? .warning
    try configure(app)
    return app
}
