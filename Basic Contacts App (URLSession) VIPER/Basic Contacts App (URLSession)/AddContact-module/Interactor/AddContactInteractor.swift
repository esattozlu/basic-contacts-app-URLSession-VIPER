//
//  AddContactInteractor.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 29.09.2022.
//

import Foundation

class AddContactInteractor: PresenterToInteractorAddContactProtocol {
    
    func saveContact(name: String, phone: String) {
        let url = URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        let postString = "kisi_ad=\(name)&kisi_tel=\(phone)"
        urlRequest.httpBody = postString.data(using: .utf8)
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if data == nil || error != nil {
                print("addContacts dataTask, data is nil or error is not nil")
                return
            }
            do {
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any] {
                    print(json)
                }
            } catch {
                print(error.localizedDescription)
            }
        }.resume()
    }

}
