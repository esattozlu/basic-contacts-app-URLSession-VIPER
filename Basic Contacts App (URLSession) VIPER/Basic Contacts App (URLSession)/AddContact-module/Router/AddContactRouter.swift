//
//  AddContactRouter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class AddContactRouter: PresenterToRoterAddContactProtocol {
    
    static func createModule(ref: AddContactVC) {
        ref.addContactPresenter = AddContactPresenter()
        ref.addContactPresenter?.addContactInteractor = AddContactInteractor()
    }

}
