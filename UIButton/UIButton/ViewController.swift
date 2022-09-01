//
//  ViewController.swift
//  UIButton
//
//  Created by Osman Esad on 1.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }
    
   
    
    @IBAction func didTapButton(_ sender: UIButton) {
        print("Butona basıldı.")
        sender.setTitleColor(UIColor.green, for: UIControl.State.normal)
        titleLabel.text = "Merhaba Label"
    }
}

