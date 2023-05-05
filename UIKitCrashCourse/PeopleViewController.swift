//
//  PeopleViewController.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 08/04/2023.
//

import UIKit
import SafariServices

class PeopleViewController: UIViewController {
    
    private let viewModel = PeopleViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 130)
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.register(PersonCollectionViewCell.self, forCellWithReuseIdentifier: "PersonCollectionViewCell")
        view.dataSource = self
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
        viewModel.delegate = self
        viewModel.getUsers()
        
        print("PeopleViewController did load.")
    }

}

extension PeopleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.people.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = viewModel.people[indexPath.item]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PersonCollectionViewCell", for: indexPath) as! PersonCollectionViewCell
        
        cell.delegate = self
        cell.item = item
        return cell
    }
}

extension PeopleViewController: PeopleViewModelDelegate {
    func didFinish() {
        collectionView.reloadData()
    }
    
    func didFail(with error: Error) {
        print(error.localizedDescription)
    }
}

extension PeopleViewController: PersonCollectionViewCellDelegate {
    func didTapSubscribe() {
        let url = URL(string: "https://bartminski.ga")!
        let viewController = SFSafariViewController(url: url)
        viewController.modalPresentationStyle = .formSheet
        self.present(viewController, animated: true)
    }
}

private extension PeopleViewController {
    func setup() {
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationItem.title = "People"
        
        view.backgroundColor = .systemBackground
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
