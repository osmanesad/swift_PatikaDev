//
//  ViewController.swift
//  UILabel
//
//  Created by Osman Esad on 1.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel! // Interface Builder(IB)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "Merhaba iOS"
        label.font = UIFont.systemFont(ofSize: 36.0)
        label.textColor = UIColor.systemPink
        
    }


}

