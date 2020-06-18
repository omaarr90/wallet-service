import Vapor
import Application
import Repository

/// Register your application's routes here.
func routes(_ app: Application) throws {
    // Basic "It works" example
    app.get { req in
        return "It works!"
    }
    
    // Basic "Hello, world!" example
    app.get("hello") { req in
        return "Hello, world!"
    }
    let diProvider = DependencyInjectionProvider(app: app)
    let userRepo = diProvider.userRepo
    let registerUseCase = RegisterByPhoneUseCaseImpl(repo: userRepo)
    let authController = AuthControllerImp(registerUseCase: registerUseCase)
    app.post("register", use: authController.register)
}
