//
//  ViewControllerProtocols.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

protocol ViewToPresenterViewControllerProtocol {
    var interactorViewController: PresenterToInteractorViewControllerProtocol? {get set}
    var viewViewController: PresenterToViewViewControllerProtocol? {get set}
    
    func getAllContacts()
    func searchContacts(name: String)
    func deleteContacts(id: String)
}

protocol PresenterToInteractorViewControllerProtocol {
    var presenterViewController: InteractorToPresenterViewControllerProtocol? {get set}
    
    func getAll()
    func search(name: String)
    func delete(id: String)
}

protocol InteractorToPresenterViewControllerProtocol {
    func sendContactListToPresenter(contactList: [Contact])
    func sendDeleteSuccessToPresenter(success: Int)
}

protocol PresenterToViewViewControllerProtocol {
    func sendContactListToView(contactList: [Contact])
    func sendDeleteSuccessToView(success: Int)
}

protocol PresenterToRouterViewControllerProtocol {
    static func createModule(ref: ViewController)
}
