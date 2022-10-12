//
//  UpdateContactVC.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit

class UpdateContactVC: UIViewController {
    
    @IBOutlet weak var contactNameText: UITextField!
    @IBOutlet weak var phoneNumbText: UITextField!
    
    var contact: Contact?
    var updateContactPresenter: ViewToPresenterUpdateContactProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let contact = contact {
            contactNameText.text = contact.kisi_ad
            phoneNumbText.text = contact.kisi_tel
        }
        
        UpdateContactRouter.createModule(ref: self)
        
    }
    
    @IBAction func updateButtonClicked(_ sender: Any) {
        
        if let contact = contact, let name = contactNameText.text, let phone = phoneNumbText.text {
            
            updateContactPresenter?.updateContact(id: contact.kisi_id!, name: name, phone: phone)
            
        }
        navigationController?.popViewController(animated: true)
        
    }

}
