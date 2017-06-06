//
//  FieldViewController.swift
//  Sort
//
//  Created by 池翔 on 2017/6/6.
//  Copyright © 2017年 池翔. All rights reserved.
//

import UIKit
import Eureka

class FieldViewController: FormViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    func setupUI() {
        self.title = "Field"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        
        form +++
            TextRow("栏位名称") {
                $0.title = $0.tag
            }
        
        <<<    PushRow<FieldType>("栏位类型") {
                $0.title = $0.tag
                $0.options = FieldType.allValues
            }
    }
    
    func add() {
        
    }
    
    enum FieldType {
        case Text
        case Select
        
        static let allValues = [Text, Select]
    }
}
