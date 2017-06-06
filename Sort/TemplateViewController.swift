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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "FieldViewControllerSegue"{
            let controller = segue.destination as! FieldViewController
            controller.itemString = sender as? String
        }
    }
    
    func add() {
        self.performSegue(withIdentifier: "FieldViewControllerSegue", sender: "newField")
    }
}
