import Vapor
import Application
import Repository

private var appControllers: [WalletController] = []
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
    let createPasswordUseCase = CreatePasswordUseCaseImpl(repo: userRepo)
    appControllers.append(contentsOf: [
        AuthController(registerUseCase: registerUseCase, createPasswordUseCase: createPasswordUseCase, app: app)
    ])
}
