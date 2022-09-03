//
//  ViewController.swift
//  UIActivitiyIndicator
//
//  Created by Osman Esad on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var bilgialTextField: UITextField!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var hataLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        hataLabel.isHidden = true
    }
    @IBAction func bilgialButton(_ sender: Any) {
        if passwordTextField.text == "1234" {
            bilgialTextField.text = "Bilgi yüklendi."
            activityIndicator.stopAnimating()
            hataLabel.isHidden = true
        } else if (passwordTextField.text != nil) {
            hataLabel.isHidden = false
            bilgialTextField.text = "Yeniden deneyin."
            activityIndicator.startAnimating()
        }
       
    }
    

}

