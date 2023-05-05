//
//  PeopleViewModel.swift
//  UIKitCrashCourse
//
//  Created by Marcin Bartminski on 05/05/2023.
//

import Foundation

protocol PeopleViewModelDelegate: AnyObject {
    func didFinish()
    func didFail(with error: Error)
}

class PeopleViewModel {
    
    private(set) var people = [PersonResponse]()
    
    weak var delegate: PeopleViewModelDelegate?
    
    @MainActor func getUsers() {
        Task { [weak self] in
            do {
                let url = URL(string: "https://reqres.in/api/users")!
                let (data, _) = try await URLSession.shared.data(from: url)
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                self?.people = try decoder.decode(UsersResponse.self, from: data).data
                self?.delegate?.didFinish()
            } catch {
                self?.delegate?.didFail(with: error)
            }
        }
    }
    
}
