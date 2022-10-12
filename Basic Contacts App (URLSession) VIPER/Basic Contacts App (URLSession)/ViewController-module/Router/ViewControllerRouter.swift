//
//  ViewControllerRouter.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class ViewControllerRouter: PresenterToRouterViewControllerProtocol {
    
    static func createModule(ref: ViewController) {
        let presenter = ViewControllerPresenter()
        
        ref.presenterViewController = presenter
        ref.presenterViewController?.viewViewController = ref
        ref.presenterViewController?.interactorViewController = ViewControllerInteractor()
        ref.presenterViewController?.interactorViewController?.presenterViewController = presenter
    }
    
}
