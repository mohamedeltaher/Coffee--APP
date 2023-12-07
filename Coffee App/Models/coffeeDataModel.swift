//
//  coffeeDataModel.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 11/09/2022.
//

import Foundation
struct coffeeDataModel : Codable {
    var name: String
    var description : String
    var isMostSelling : Bool
    var price: Int
    let image, imageS, imageM, imageL: String
    var size, sugar, additions: Int
    var isAddedToCart: Bool
    var boughtItemsCount: Int
}

