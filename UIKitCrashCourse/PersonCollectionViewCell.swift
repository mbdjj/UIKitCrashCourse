//
//  PersonCollectionViewCell.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 05/05/2023.
//

import UIKit

class PersonCollectionViewCell: UICollectionViewCell {
    
    private var view: PersonView?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private extension PersonCollectionViewCell {
    func setup() {
        guard view == nil else { return }
        
        view = PersonView {
            
        }
        
        self.contentView.addSubview(view!)
        
        NSLayoutConstraint.activate([
            view!.topAnchor.constraint(equalTo: contentView.topAnchor),
            view!.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            view!.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            view!.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8)
        ])
    }
}
