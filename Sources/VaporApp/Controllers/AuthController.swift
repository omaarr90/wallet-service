import Vapor
import Application
import Repository

protocol WalletController {
}

struct AuthController: WalletController {
    
    struct RegisterInput: Content {
        let phoneNumber: Int64
        let fullname: String
    }

    struct CreatePasswordInput: Content {
        let phoneNumber: Int64
        let password: String
    }

    private let registerUseCase: RegisterUseCase
    private let createPasswordUseCase: CreatePasswordUseCase
    private let app: Vapor.Application
    init(registerUseCase: RegisterUseCase,
         createPasswordUseCase: CreatePasswordUseCase,
         app: Vapor.Application) {
        self.registerUseCase = registerUseCase
        self.createPasswordUseCase = createPasswordUseCase
        self.app = app
        configureRoutes()
    }
    
    private func configureRoutes() {
        let usersPath = app.grouped("users")
        usersPath.post(use: register)
        usersPath.post("password", use: createPassword)
    }
    
    func register(_ req: Request) throws -> EventLoopFuture<Response> {
        let prmoise = req.eventLoop.makePromise(of: Response.self)
        guard let content = try? req.content.decode(RegisterInput.self) else {
            prmoise.succeed(Response(status: .badRequest))
            return prmoise.futureResult
        }
        
        let input = RegisterUseCaseInput(fullname: content.fullname, phoneNumber: content.phoneNumber)
        
        registerUseCase.execute(input: input) { result in
            switch result {
            case .failure(_):
                prmoise.succeed(Response(status: .badRequest))
            case .success(_):
                let response = Response(status: .created)
                prmoise.succeed(response)
            }
        }

        return prmoise.futureResult
    }
    
    func createPassword(_ req: Request) throws -> EventLoopFuture<Response> {
        let prmoise = req.eventLoop.makePromise(of: Response.self)
        guard let content = try? req.content.decode(CreatePasswordInput.self) else {
            prmoise.succeed(Response(status: .badRequest))
            return prmoise.futureResult
        }
        
        let input = CreatePasswordUseCaseInput(password: content.password, phoneNumber: content.phoneNumber)
        
        createPasswordUseCase.execute(input: input) { result in
            switch result {
            case .failure(_):
                prmoise.succeed(Response(status: .badRequest))
            case .success(_):
                let response = Response(status: .created)
                prmoise.succeed(response)
            }
        }

        return prmoise.futureResult
    }
}
