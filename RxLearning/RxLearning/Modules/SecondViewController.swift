//
//  SecondViewController.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 30/1/24.
//

import UIKit
import RxSwift
import RxCocoa

class SecondViewController: UIViewController {

    
    var label : UILabel!
    
    let bag = DisposeBag()
    
    var imageName = BehaviorRelay<String>(value: "")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("viewDidLoad")
        self.view.backgroundColor = .cyan
        self.setupImageView()
        imageName.subscribe { [weak self]  value in
            self?.label.text = value
        }.disposed(by: bag)
    }
    
    func setupImageView(){
        self.label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.contentMode = .scaleAspectFit
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.widthAnchor.constraint(equalToConstant: view.frame.width)
            
        ])
    }
 

}
