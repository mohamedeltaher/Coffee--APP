//
//  LoginResponse.swift
//  Coffee App
//
//  Created by Mostafa Elamory on 14/09/2022.
//

import Foundation
struct LoginResponse : Codable {
    let token : String
    let email: String
    let userName:String
}
