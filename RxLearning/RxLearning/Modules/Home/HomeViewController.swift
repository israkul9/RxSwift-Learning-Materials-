//
//  ViewController.swift
//  RxLearning
//
//  Created by Israkul Tushaer-81 on 29/1/24.
//

import UIKit
import RxSwift
import RxCocoa



class HomeViewController: UIViewController {
    
    var homeViewModel : HomeViewModel = HomeViewModel()
    let bag = DisposeBag()
    var homeTableView : UITableView!
    
    
    // Create a PublishSubject of type String
    private let publishSubject = PublishSubject<[String]>()
    
    // Create a behaviour subject
    private let behaviourSubject = BehaviorSubject<String>(value: "Initial Value")
    
    // Create a Reply Subject
    
    private let replaySubject = ReplaySubject<String>.create(bufferSize: 2)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        self.title = "Food Menu"
       // self.createButton()
        self.homeViewModel = HomeViewModel()
          self.setupHomeTableView()
          self.bindData()
        
        
        // binding data to publish subject
        
        //   self.bindingPublishSubjects()
        
       
        
      //  self.bindingBehaviourSubjects()
        
       
    }
    @objc func buttonTapped() {
        // print("")
        // Add your button tap logic here
        //  self.publishSubject.onNext(["Button tapped!" , "1"])
        let data = ["1" , "2" , "3"]
        self.replaySubject.onNext("1")
        self.replaySubject.onNext("2")
        self.replaySubject.onNext("3")
     
        self.bindingReplaySubjects()
        
    }
    
    
    func bindingReplaySubjects(){
        replaySubject.subscribe {
            event in
            
            switch event {
            case.next(let value) :
                print("Replay subject value : ",value)
            case.error(let error) :
                print(error.localizedDescription)
            case.completed :
                print("completed")
            }
        }.disposed(by: bag)
    }
    
    
    func bindingBehaviourSubjects(){
        behaviourSubject.subscribe {
            event in
            
            switch event {
            case.next(let value) :
                print("Behaviour subject value : ",value)
            case.error(let error) :
                print(error.localizedDescription)
            case.completed :
                print("completed")
            }
        }.disposed(by: bag)
    }
    
    func bindingPublishSubjects(){
        publishSubject.subscribe {
            event in
            
            switch event {
            case.next(let value) :
                print("Publish subject value ",value)
            case.error(let error) :
                print(error.localizedDescription)
            case.completed :
                print("completed")
            }
        }
        .disposed(by: bag)
        
        
        let subscriber2 = publishSubject.subscribe(onNext: { value in
            print("Subscriber 2 received value: \(value)")
        })
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    private func setupHomeTableView(){
      
        self.homeTableView = UITableView(frame: .zero, style: .grouped)
        self.homeTableView.register(UINib(nibName: "HomeTableViewCell", bundle: nil), forCellReuseIdentifier: "HomeTableViewCell")
        self.homeTableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0)
        self.view.addSubview(self.homeTableView)
        //   self.homeTableView.backgroundColor = .systemYellow
        
        self.homeTableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            homeTableView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 0),
            homeTableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor , constant: 0) ,
            homeTableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor , constant: 0),
            homeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0)
               ])
        
        self.homeTableView.backgroundColor = .yellow
        
    }
    
    private func bindData(){
        // binding data with tableView
        self.homeViewModel.foodItems.bind(to: self.homeTableView
            .rx
            .items(cellIdentifier: "HomeTableViewCell", cellType: HomeTableViewCell.self)) { ( tv , item , cell) in
                cell.NameLabel.text = item.foodName
                cell.PriceLabel.text = item.foodPrice
                cell.DescriptionLabel.text = item.foodDescription
            }
            .disposed(by: bag)
        
        
        
        // Handle row selection
        homeTableView
            .rx.modelSelected(FoodModel.self)
            .subscribe(onNext: { [weak self] selectedFoodItem in
                
                let vc  = SecondViewController()
                
                vc.imageName.accept(selectedFoodItem.foodDescription)
                
                self?.navigationController?.pushViewController(vc, animated: true)
                
                print(selectedFoodItem.foodName)
            })
            .disposed(by: self.bag)
        
        // Handle row selection with indexPath
        homeTableView
            .rx.itemSelected.subscribe(onNext : {[weak self] indexPath in
                print(indexPath.row)
            })
            .disposed(by: bag)
    }
    
    func createButton(){
        // Create a UIButton instance
        let myButton = UIButton(type: .system)
        
        // Set button properties
        myButton.setTitle("Tap Me", for: .normal)
        myButton.setTitleColor(.white, for: .normal)
        myButton.backgroundColor = .blue
        
        // Add target-action for button tap
        myButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        // Set button frame (you can customize this based on your layout)
        //   myButton.frame = CGRect(x: 100, y: 100, width: 200, height: 40)
        
        // Add the button to the view controller's view
        view.addSubview(myButton)
        myButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            myButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            myButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            myButton.widthAnchor.constraint(equalToConstant: 200),
            myButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
}


extension HomeViewController  {
    

}
