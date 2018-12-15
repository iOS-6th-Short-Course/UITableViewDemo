//
//  SecondScreenViewController.swift
//  UITableViewDemo
//
//  Created by Chhaileng Peng on 12/15/18.
//  Copyright © 2018 Chhaileng Peng. All rights reserved.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    
    var text: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let text = text {
            label.text = text
        }
    }

}
