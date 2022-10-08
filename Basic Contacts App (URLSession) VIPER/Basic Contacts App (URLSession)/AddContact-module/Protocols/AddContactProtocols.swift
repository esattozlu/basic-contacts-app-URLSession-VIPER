//
//  AddContactProtocols.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

protocol ViewToPresenterAddContactProtocol {
    
    var addContactInteractor: PresenterToInteractorAddContactProtocol? {get set}
    
    func addContact(name: String, phone: String)
}

protocol PresenterToInteractorAddContactProtocol {
    
    func saveContact(name: String, phone: String)
}

protocol PresenterToRoterAddContactProtocol {
    static func createModule(ref: AddContactVC)
}
