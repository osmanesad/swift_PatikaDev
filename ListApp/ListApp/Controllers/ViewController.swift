//
//  ViewController.swift
//  ListApp
//
//  Created by Osman Esad on 6.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var alertController = UIAlertController()
    @IBOutlet weak var tableView: UITableView!
    var exampleData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return exampleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)
        cell.textLabel?.text = exampleData[indexPath.row]
        return cell
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
                self.exampleData.append((text)!)
                self.tableView.reloadData()
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
}

