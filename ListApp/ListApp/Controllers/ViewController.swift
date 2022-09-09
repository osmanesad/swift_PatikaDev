//
//  ViewController.swift
//  ListApp
//
//  Created by Osman Esad on 6.09.2022.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    var alertController = UIAlertController()
    @IBOutlet weak var tableView: UITableView!
    
    var exampleData = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
       
        fetch()
        
    }
    
    
    @IBAction func didRemoveBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        presentAlert(title: "Uyarı",
                     message: "Listedeki bütün elemanlar silinicek",
                     preferredStyle: .alert,
                     cancelButtonTitle: "İptal",
                     isTextFieldAvailable: false,
                     defaultButtonTitle: "Sil") { _ in
            self.exampleData.removeAll()
            self.tableView.reloadData()
        }
        
    }
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem) {
        presentAddAlert()
    }
    
    // MARK: Show Alert Dunction -
    func presentAddAlert() {
        presentAlert(title: "Yeni eleman ekle",
                     message: nil,
                     preferredStyle: .alert,
                     cancelButtonTitle: "Vazgeç",
                     isTextFieldAvailable: true,
                     defaultButtonTitle: "Ekle", defaultButtonHandler: { _ in
            let text = self.alertController.textFields?.first?.text
            if text != "" {
//
                // MARK: Veritabanına Kayıt İşlemleri -
                
                
                let appDelegate = UIApplication.shared.delegate as? AppDelegate
                
                let  managedObjectContext = appDelegate?.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "ListData", in: managedObjectContext!)
                
                let listItem = NSManagedObject(entity: entity!, insertInto: managedObjectContext)
                
                listItem.setValue(text, forKey: "content")
                
                try? managedObjectContext?.save()
                
                
                
                self.fetch()
            } else {
                self.presentWarningAlert()
            }
        })
    }
    
    // MARK: Warning Alert Function -
    func presentWarningAlert() {
        presentAlert(title: "Uyarı", message: "Listeye boş eleman eklenemez", cancelButtonTitle: "Tamam")
    }
    
    func presentAlert(title: String, message: String?, preferredStyle: UIAlertController.Style = .alert, cancelButtonTitle: String?, isTextFieldAvailable: Bool = false,defaultButtonTitle: String? = nil, defaultButtonHandler: ((UIAlertAction)-> Void)? = nil) {
        
        alertController = UIAlertController(title: title, message: message, preferredStyle: preferredStyle)
        
        let cancelButton = UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: nil)
        
        if defaultButtonTitle != nil {
            let defaultButton = UIAlertAction(title: defaultButtonTitle, style: .default, handler: defaultButtonHandler)
            alertController.addAction(defaultButton)
        }
        
        if isTextFieldAvailable {
            alertController.addTextField()
        }
        
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
        
    }
// MARK: Fetch Function -
    func fetch() {
        
        let appDelegate = UIApplication.shared.delegate as? AppDelegate
        let managedObjectContext = appDelegate?.persistentContainer.viewContext
        
        let fecthRequest = NSFetchRequest<NSManagedObject>(entityName: "ListData")
        
        exampleData =  try! managedObjectContext!.fetch(fecthRequest)
        tableView.reloadData()
        
    }
}



extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        let listItem = exampleData[indexPath.row]
        cell.textLabel?.text = listItem.value(forKey: "content") as! String
        return cell
    }
    
    
    // MARK: Listeden eleman silme -
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .normal, title: "Sil ") { [self] _, _, _ in
           // self.exampleData.remove(at: indexPath.row)
            
            
            let appDelegate = UIApplication.shared.delegate as? AppDelegate
            
            let  managedObjectContext = appDelegate?.persistentContainer.viewContext
            
            managedObjectContext?.delete(self.exampleData[indexPath.row])
            
            try? managedObjectContext?.save()
            
            self.fetch()
        }
        deleteAction.backgroundColor = .systemRed
        
        
        let editAction = UIContextualAction(style: .normal, title: "Düzelt") { _, _, _ in
            
            self.presentAlert(title: "Düzenle",
                         message: nil,
                         preferredStyle: .alert,
                         cancelButtonTitle: "İptal",
                         isTextFieldAvailable: true,
                         defaultButtonTitle: "Düzelt", defaultButtonHandler: { _ in
                let text = self.alertController.textFields?.first?.text
                if text != "" {
//
                    
                    let appDelegate = UIApplication.shared.delegate as? AppDelegate
                    
                    let  managedObjectContext = appDelegate?.persistentContainer.viewContext
                    
                    self.exampleData[indexPath.row].setValue(text, forKey: "content")
                    
                    if managedObjectContext!.hasChanges {
                        try? managedObjectContext?.save()
                    }
                    
                    self.tableView.reloadData()
                } else {
                    //self.presentWarningAlert()
                    self.tableView.reloadData()              }
            })
            
            
        }
        //editAction.backgroundColor = .blue
        
        
        let config = UISwipeActionsConfiguration(actions: [deleteAction] + [editAction])
        return config
    }
    
}
