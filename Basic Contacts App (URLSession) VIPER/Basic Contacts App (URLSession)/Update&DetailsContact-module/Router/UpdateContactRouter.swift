//
//  UpdateContactRouter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class UpdateContactRouter: PresenterToRoterUpdateContactProtocol {
        
        static func createModule(ref: UpdateContactVC) {
            ref.updateContactPresenter = UpdateContactPresenter()
            ref.updateContactPresenter?.updateContactInteractor = UpdateContactInteractor()
        }
    
}
