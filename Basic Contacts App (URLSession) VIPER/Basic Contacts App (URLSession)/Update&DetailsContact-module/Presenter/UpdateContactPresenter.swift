//
//  UpdateContactPresenter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class UpdateContactPresenter: ViewToPresenterUpdateContactProtocol {
    
    var updateContactInteractor: PresenterToInteractorUpdateContactProtocol?
    
    func updateContact(id: String, name: String, phone: String) {
        updateContactInteractor?.update(id: id, name: name, phone: phone)
    }
    
    
}
