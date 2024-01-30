//
//  HomeViewModel.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 29/1/24.
//

import Foundation
import RxSwift
import RxCocoa

class HomeViewModel {
    

    var foodItems = Observable.just(
    
        [
            FoodModel.init(foodName: "Burger" , foodDescription: "Fletcher Davis of Athens, Texas claimed to have invented the hamburger. According to oral histories, in the 1880s, he opened a lunch counter in Athens and served a 'burger' of fried ground beef patties with mustard and Bermuda onion between two slices of bread, with a pickle on the side.", foodPrice: "$10"),
            FoodModel.init(foodName: "Pizza" , foodDescription: "Pizza dates back thousands of years, believe it or not, tracing its roots back to the flatbreads with toppings that were popular with ancient Egyptians, Greeks, and Romans. But modern pizza, the flatbreads with tomato sauce, cheese, and toppings, was born along the western coast of Italy, in the city of Naples.Pizza dates back thousands of years, believe it or not, tracing its roots back to the flatbreads with toppings that were popular with ancient Egyptians, Greeks, and Romans. But modern pizza, the flatbreads with tomato sauce, cheese, and toppings, was born along the western coast of Italy, in the city of Naples.", foodPrice: "$100"),
            FoodModel.init(foodName: "Coke" , foodDescription: "On May 8, 1886, Dr. John Pemberton brought his perfected syrup to Jacobs' Pharmacy in downtown Atlanta where the first glass of Coca‑Cola was poured. Serving about nine drinks per day in its first year, Coca‑Cola was an exciting new drink in the beginning.", foodPrice: "$5")
        ]
    )
    
    
    
    init (){
        
    }
}
