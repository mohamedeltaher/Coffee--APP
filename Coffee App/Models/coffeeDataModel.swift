//
//  coffeeDataModel.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 11/09/2022.
//

import Foundation
struct coffeeDataModel : Codable {
    var name : String
    var price : Int
    var image : String
    var size : String
    var sugar : String
    var isAddedToCart : Bool
    var boughtitemscount : Int
}

