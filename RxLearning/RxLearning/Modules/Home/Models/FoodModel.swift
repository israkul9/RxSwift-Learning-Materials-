//
//  FoodModel.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 29/1/24.
//

import Foundation

class FoodModel {
    
    var foodName  = ""
    var foodDescription = ""
    var foodPrice = ""
    
    init(foodName: String = "", foodDescription: String = "", foodPrice: String = "") {
        self.foodName = foodName
        self.foodDescription = foodDescription
        self.foodPrice = foodPrice
    }
    
}
