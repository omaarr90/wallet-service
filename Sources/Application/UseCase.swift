
//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation
import Hydra

enum UseCaseError: Swift.Error {
    case invalidInput(reason: String)
    case duplicateInput
}

protocol UseCase {
    
    associatedtype Input
    associatedtype Output
    
    func execute(input: Input) -> Promise<Output>
}
