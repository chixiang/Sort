//
//  TemplateViewController.swift
//  Sort
//
//  Created by 池翔 on 2017/6/6.
//  Copyright © 2017年 池翔. All rights reserved.
//

import UIKit
import Eureka

class TemplateViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Template"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        form +++
            ButtonRow("栏位一") {
                $0.title = $0.tag
                $0.presentationMode = .segueName(segueName: "FieldViewControllerSegue", onDismiss: nil)
        }
    }
    
    func add() {
        
    }
}
