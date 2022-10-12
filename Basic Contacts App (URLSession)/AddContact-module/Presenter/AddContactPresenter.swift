//
//  AddContactPresenter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class AddContactPresenter: ViewToPresenterAddContactProtocol {
    
    var addContactInteractor: PresenterToInteractorAddContactProtocol?
    
    func addContact(name: String, phone: String) {
        addContactInteractor?.saveContact(name: name, phone: phone)
    }

}
