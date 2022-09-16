//
//  RegisterResponse.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 14/09/2022.
//

import Foundation
struct RegisterResponse : Codable {
    let id : String
    let email: String
    let userName : String
    let Password: String
}
