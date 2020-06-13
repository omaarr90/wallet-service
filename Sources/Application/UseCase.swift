
//
//  File.swift
//  
//
//  Created by Omar Alshammari on 18/10/1441 AH.
//

import Foundation

protocol UseCase {
    
    associatedtype Input
    associatedtype Output
    
    func execute(input: Input) -> Output
}
