//
//  ViewController.swift
//  Basic Contacts App (URLSession)
//
//  Created by Hasan Esat Tozlu on 20.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var contactsTableView: UITableView!
    
    var contactsList = [Contact]()
    var isSearching = false
    var searchingText: String?
    var presenterViewController: ViewToPresenterViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        contactsTableView.delegate = self
        contactsTableView.dataSource = self
        searchBar.delegate = self
        ViewControllerRouter.createModule(ref: self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
            if self.isSearching {
                self.presenterViewController?.searchContacts(name: self.searchingText!)
            } else {
                self.presenterViewController?.getAllContacts()
                DispatchQueue.main.async {
                    self.contactsTableView.reloadData()
                }
            }
            self.contactsTableView.reloadData()
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let index = sender as? Int
        
        if segue.identifier == "toDetails" {
            let destinationVC = segue.destination as! ShowDetailsVC
            destinationVC.contact = contactsList[index!]
        }
        
        if segue.identifier == "toUpdateContact" {
            let destinationVC = segue.destination as! UpdateContactVC
            destinationVC.contact = contactsList[index!]
        }
        
    }
    
}

extension ViewController: PresenterToViewViewControllerProtocol {
    func sendDeleteSuccessToView(success: Int) {
        // tableview yenilemesini çözmek için ekledim fakat bazen hala sorun yaşanıyor
        if success == 1 {
            DispatchQueue.main.async {
                self.contactsTableView.reloadData()
            }
        }
    }
    
    func sendContactListToView(contactList: [Contact]) {
        self.contactsList = contactList
        DispatchQueue.main.async {
            self.contactsTableView.reloadData()
        }
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contactsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let contact = contactsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "contactCell", for: indexPath) as! ContactCell
        cell.contactSummaryLabel.text = contact.kisi_ad
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetails", sender: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextualAction, view, boolValue in
            let kisi = self.contactsList[indexPath.row]
            
            self.presenterViewController?.deleteContacts(id: kisi.kisi_id!)
            
            if self.isSearching {
                self.presenterViewController?.searchContacts(name: self.searchingText!)
            } else {
                self.presenterViewController?.getAllContacts()
            }
            DispatchQueue.main.async {
                self.contactsTableView.reloadData()
            }
            
        }
        
        let updateAction = UIContextualAction(style: .normal, title: "Update") { contextualAction, view, boolValue in
            self.performSegue(withIdentifier: "toUpdateContact", sender: indexPath.row)
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction, updateAction])
        
    }

}

extension ViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("Arama \(searchText)")
        
        searchingText = searchText
        if searchText == "" {
            isSearching = false
            self.presenterViewController?.getAllContacts()
        } else {
            isSearching = true
            self.presenterViewController?.searchContacts(name: searchText)
        }
        contactsTableView.reloadData()
    }
    
}
