//
//  PersonView.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 08/04/2023.
//

import UIKit

class PersonView: UIView {

    private lazy var subscribeButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Subscribe".uppercased()
        config.baseBackgroundColor = .red
        config.baseForegroundColor = .white
        config.buttonSize = .large
        config.cornerStyle = .medium
        
        let button = UIButton(configuration: config)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(subscribePressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Billy Bob"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "billy.bob@gmail.com"
        label.font = .systemFont(ofSize: 15, weight: .regular)
        return label
    }()
    
    private lazy var personStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private var action: () -> ()
    
    init(action: @escaping () -> ()) {
        self.action = action
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func set(name: String, email: String) {
        nameLabel.text = name
        emailLabel.text = email
    }
    
}

private extension PersonView {
    func setup() {
        self.backgroundColor = .gray.withAlphaComponent(0.1)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.layer.cornerRadius = 10
        
        self.addSubview(personStackView)
        personStackView.addArrangedSubview(nameLabel)
        personStackView.addArrangedSubview(emailLabel)
        personStackView.addArrangedSubview(subscribeButton)
        
        NSLayoutConstraint.activate([
            personStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            personStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8),
            personStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            personStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8)
        ])
    }
    
    @objc func subscribePressed(sender: UIButton) {
        action()
    }
}
