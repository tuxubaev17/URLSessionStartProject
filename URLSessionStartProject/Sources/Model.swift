//
//  Model.swift
//  URLSessionStartProject
//
//  Created by Alexey Pavlov on 29/11/21.
//

import Foundation
import FileProvider
import UIKit

struct Employees: Decodable {
    let employees: [Employee]
}

struct Employee: Decodable {
    let firstName: String
    let lastName: String
    let age: String
    let position: String
    let derpatment: String
    
    enum Codingkeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case age = "ageOf"
        case position
    }
   
    enum PositionCodingKeys: String, CodingKey {
        case position
        case department
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Codingkeys.self)
        
        firstName = try container.decode(String.self, forKey: Codingkeys.firstName)
        lastName = try container.decode(String.self, forKey: Codingkeys.lastName)
        age = try container.decode(String.self, forKey: Codingkeys.age)
        
        let positionContainer = try decoder.container(keyedBy: PositionCodingKeys.self)
        
        position = try positionContainer.decode(String.self, forKey: PositionCodingKeys.position)
        derpatment = try positionContainer.decode(String.self, forKey: PositionCodingKeys.department)
    }
    
}

