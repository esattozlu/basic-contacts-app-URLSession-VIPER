//
//  UpdateContactProtocols.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

protocol ViewToPresenterUpdateContactProtocol {
    
    var updateContactInteractor: PresenterToInteractorUpdateContactProtocol? {get set}
    
    func updateContact(id: String, name: String, phone: String)
}

protocol PresenterToInteractorUpdateContactProtocol {
    
    func update(id: String, name: String, phone: String)
}

protocol PresenterToRoterUpdateContactProtocol {
    static func createModule(ref: UpdateContactVC)
}
