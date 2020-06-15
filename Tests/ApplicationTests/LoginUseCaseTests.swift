import XCTest
import Hydra
@testable import Application

final class LoginUseCaseTests: XCTestCase {
    
    func testLoginWithValidCredintial() {
        let useCase = LoginUseCase()
        let loginInput = LoginUseCase.LoginInput()
        let loginOutput = try! await(useCase.execute(input: loginInput))
        XCTAssertTrue(loginOutput.success)
    }

    static let allTests = [
        ("testLoginWithValidCredintial", testLoginWithValidCredintial)
    ]
}

