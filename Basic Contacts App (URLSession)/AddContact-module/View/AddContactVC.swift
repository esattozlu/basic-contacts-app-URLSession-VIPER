//
//  AddContactVC.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit

class AddContactVC: UIViewController {
    
    
    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var phoneNumbText: UITextField!
    var addContactPresenter: ViewToPresenterAddContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AddContactRouter.createModule(ref: self)
    }
    

    @IBAction func addButtonClicked(_ sender: Any) {
        
        if let name = contactNameText.text, let phone = phoneNumbText.text {
        
            addContactPresenter?.addContact(name: name, phone: phone)
            
        }
        navigationController?.popViewController(animated: true)
        
    }
    
}
