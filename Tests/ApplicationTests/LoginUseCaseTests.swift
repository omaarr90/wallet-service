import XCTest
@testable import Application

final class LoginUseCaseTests: XCTestCase {
    
    func testLoginWithValidCredintial() {
        let useCase = LoginUseCase()
        let loginInput = LoginUseCase.LoginInput()
        XCTFail("Not Implemented")
    }

    static let allTests = [
        ("testLoginWithValidCredintial", testLoginWithValidCredintial)
    ]
}

