//
//  ContactsResponse.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 28.09.2022.
//

import Foundation

class ContactsResponse: Codable {
    var kisiler: [Contact]?
    var success: Int?
}
