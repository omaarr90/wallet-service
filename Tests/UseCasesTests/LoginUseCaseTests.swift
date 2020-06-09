import XCTest
@testable import UseCases

final class LoginUseCaseTests: XCTestCase {
    
    func testLoginWithValidCredintial() {
        let useCase = LoginUseCase()
        let loginInput = LoginUseCase.LoginInput()
        
        let loginOutput = useCase.execute(input: loginInput)
        XCTAssertTrue(loginOutput.success)
    }

    static let allTests = [
        ("testLoginWithValidCredintial", testLoginWithValidCredintial)
    ]
}

