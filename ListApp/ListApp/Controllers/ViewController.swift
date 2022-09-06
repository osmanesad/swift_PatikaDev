//
//  ViewController.swift
//  ListApp
//
//  Created by Osman Esad on 6.09.2022.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
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
    
    @IBAction func didAddBarButtonItemTapped(_ sender: UIBarButtonItem) {
        
        let alertController = UIAlertController(title: "Yeni içerik eklenecek.", message: nil, preferredStyle: .alert)
        
        
        
        let defaultButton = UIAlertAction(title: "Ekle", style: .default) { _ in
            let text = alertController.textFields?.first?.text
            
            if text != "" {
                self.exampleData.append((text)!)
                self.tableView.reloadData()
                
            } else {
                
                let alertController = UIAlertController(title: "Uyarı", message: "Listeye boş eleman eklenemez", preferredStyle: .alert)
                
                let cancelButton = UIAlertAction(title: "Tamam", style: .cancel, handler: nil)
                
                alertController.addAction(cancelButton)
                self.present(alertController, animated: true)
                
                
                
            }
            
        }
        
        let cancelButton = UIAlertAction(title: "İptal", style: .cancel, handler: nil)
        
        
        
        alertController.addTextField()
        
        alertController.addAction(defaultButton)
        alertController.addAction(cancelButton)
        present(alertController, animated: true)
        
        
    }
    
    
    
}

