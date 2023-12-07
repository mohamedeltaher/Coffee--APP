//
//  Constants.swift
//  Coffee App
//
//  Created by Mohamed Eltaher on 12/09/2022.
//

import Foundation
import UIKit
/*
 var name: String
var price: Int
let image, imageS, imageM, imageL: String
var size, sugar, additions: Int
var isAddedToCart: Bool
var boughtItemsCount, id: Int 
 */
var productlist = [
    coffeeDataModel( name: "Iced White Chocolate Mocha", description: "Espresso, milk and white chocolate flavoured sauce, poured over ice and without whipped cream. ", isMostSelling:true, price: 30, image: "Iced_White_Chocolate" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    
    coffeeDataModel( name: "Café Latte", description: "Classic espresso is balanced with steamed milk and topped with a light layer of foam", isMostSelling: true, price: 25, image: "Café_Latte" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 3 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    
    coffeeDataModel( name: "Cappuccino", description: "Dark, rich espresso lies in wait under a smoothed and stretched layer of thick milk foam", isMostSelling: true, price: 34, image: "Cappuccino" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    
    coffeeDataModel( name: "Turkey And Cheese Croissant", description: "Turkey, sauteed mushrooms, cheddar cheese, kashkaval cheese and halloumi cheese in our flaky signature croissant", isMostSelling: true , price: 15 , image: "Turkey_And_Cheese" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    
    coffeeDataModel( name: "White Chocolate Mocha", description: "Espresso complemented with white chocolate flavoured sauce and steamed milk.", isMostSelling: true , price: 10, image: "White_Chocolate" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    
    coffeeDataModel( name: "Blueberry Cheesecake", description: "Rich and creamy cheesecake sitting on a crunchy biscuit layer and topped with a sweet and tangy blueberry compote", isMostSelling: true, price: 17, image: "blueperry_chees" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
    coffeeDataModel( name: "Blueberry Cheesecake", description: "Rich and creamy cheesecake sitting on a crunchy biscuit layer and topped with a sweet and tangy blueberry compote", isMostSelling: true, price: 17, image: "blueperry_chees" ,imageS: "iv_coffe_small" ,imageM: "iv_coffe_med",imageL: "iv_coffe_large",size: 15 ,sugar: 1 ,additions: 0, isAddedToCart: false, boughtItemsCount: 0),
                  ]
var cartitems : [NetworkDataModel] = []

