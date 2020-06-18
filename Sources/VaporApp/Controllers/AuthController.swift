import Vapor
import Application
import Repository

protocol AuthController {
    func register(_ req: Request) throws -> EventLoopFuture<Response>
}

struct AuthControllerImp: AuthController {
    
    struct RegisterInput: Content {
        let phoneNumber: Int64
        let fullname: String
    }
    
    private let registerUseCase: RegisterByPhoneUseCaseImpl
    init(registerUseCase: RegisterByPhoneUseCaseImpl) {
        self.registerUseCase = registerUseCase
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
            case let .failure(_):
                prmoise.succeed(Response(status: .badRequest))
//                prmoise.fail(error)
            case .success(_):
                let response = Response(status: .created)
                prmoise.succeed(response)
            }
        }

        return prmoise.futureResult
    }
}
