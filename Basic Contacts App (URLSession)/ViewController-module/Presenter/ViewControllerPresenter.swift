//
//  ViewControllerPresenter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class ViewControllerPresenter: ViewToPresenterViewControllerProtocol {
    var interactorViewController: PresenterToInteractorViewControllerProtocol?
    
    var viewViewController: PresenterToViewViewControllerProtocol?
    
    func getAllContacts() {
        interactorViewController?.getAll()
    }
    
    func searchContacts(name: String) {
        interactorViewController?.search(name: name)
    }
    
    func deleteContacts(id: String) {
        interactorViewController?.delete(id: id)
    }
    
}

extension ViewControllerPresenter: InteractorToPresenterViewControllerProtocol {
    func sendDeleteSuccessToPresenter(success: Int) {
        viewViewController?.sendDeleteSuccessToView(success: success)
    }
    
    
    func sendContactListToPresenter(contactList: [Contact]) {
        viewViewController?.sendContactListToView(contactList: contactList)
    }

}
