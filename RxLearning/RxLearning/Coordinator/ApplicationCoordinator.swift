//
//  ApplicationCoordinator.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 29/1/24.
//

import Foundation
import UIKit

class ApplicationCoordinator : Coordinator {
    
    var rootViewCntroller = UINavigationController()
    var window = UIWindow()
    var childCoordinators = [Coordinator]()
    
    init ( window : UIWindow){
        self.window = window
    }
    
    func start() {
        let viewController = HomeViewController()
        self.rootViewCntroller = UINavigationController(rootViewController: viewController)
        self.window.rootViewController = self.rootViewCntroller
        self.window.makeKeyAndVisible()
        
    }
}
