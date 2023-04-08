//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 08/04/2023.
//

import UIKit

class PeopleViewController: UIViewController {
    
    private lazy var personView: PersonView = {
        PersonView { [weak self] in
            self?.sayHello()
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        
        print("PeopleViewController did load.")
    }

}

private extension PeopleViewController {
    func setup() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(personView)
        
        NSLayoutConstraint.activate([
            personView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            personView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            personView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8)
        ])
    }
    
    func sayHello() {
        print("Hello!")
    }
}
