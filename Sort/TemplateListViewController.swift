//
//  ViewController.swift
//  Sort
//
//  Created by 池翔 on 2017/5/20.
//  Copyright © 2017年 池翔. All rights reserved.
//

import UIKit
import Eureka

class TemplateListViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Template List"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))

        form +++
            Section()
            <<< ButtonRow("模版一") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "TemplateViewControllerSegue", onDismiss: nil)
        }
    }
    
    func add() {
        
    }
}

