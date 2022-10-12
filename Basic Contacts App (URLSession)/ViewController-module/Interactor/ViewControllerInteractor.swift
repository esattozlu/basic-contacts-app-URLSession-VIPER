//
//  ViewControllerInteractor.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class ViewControllerInteractor: PresenterToInteractorViewControllerProtocol {
    var presenterViewController: InteractorToPresenterViewControllerProtocol?
    
    func getAll() {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!
        URLSession.shared.dataTask(with: url) { data, response, error in
            if data == nil || error != nil {
                print("getAllContacts dataTask error!")
                return
            }
            do {
                let contactsResponse = try JSONDecoder().decode(ContactsResponse.self, from: data!)
                if let contacts = contactsResponse.kisiler {
                    self.presenterViewController?.sendContactListToPresenter(contactList: contacts)
                } else {
                    self.presenterViewController?.sendContactListToPresenter(contactList: [Contact]())
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func search(name: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let postString = "kisi_ad=\(name)"
        urlRequest.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if data == nil || error != nil {
                print("searchContacts dataTask error!")
                return
            }
            do {
                let searchedContactResponse = try JSONDecoder().decode(ContactsResponse.self, from: data!)
                if let searchedContacts = searchedContactResponse.kisiler {
                    self.presenterViewController?.sendContactListToPresenter(contactList: searchedContacts)
                }
            } catch {
                print(error.localizedDescription)
                self.presenterViewController?.sendContactListToPresenter(contactList: [Contact]())
            }
        }.resume()
    }
    
    func delete(id: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let postString = "kisi_id=\(id)"
        urlRequest.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if data == nil || error != nil {
                print("deleteContacts dataTask error!")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any] {
                    print(json)
                    if let success = json["success"] as? Int {
                        self.presenterViewController?.sendDeleteSuccessToPresenter(success: success)
                    }
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }
    
 
}
