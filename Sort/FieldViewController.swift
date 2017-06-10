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
    
    var viewModel: ViewModel!
    var itemString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        form +++
            TextRow("栏位名称") {
                $0.title = $0.tag
                $0.value = viewModel.fieldName
                $0.onChange { [unowned self] row in
                    self.viewModel.fieldName = row.value
                }
            }
            
            <<< PushRow<String>("栏位类型") {
                $0.title = $0.tag
                $0.value = viewModel.fieldType
                $0.options = viewModel.fieldTypeOptions
                $0.onChange { [unowned self] row in //5
                    if let value = row.value {
                        self.viewModel.fieldType = value
                    }
                }
        }
    }
    
    convenience init(viewModel: ViewModel) {
        self.init()
        self.viewModel = viewModel
        initialize()
    }
    
    func initialize() {
//        self.title = "Field"
//        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(add))
        let deleteButton = UIBarButtonItem(title: "Delete", style: .plain, target: self, action: .deleteButtonPressed)
        navigationItem.leftBarButtonItem = deleteButton
        
        let saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: .saveButtonPressed)
        navigationItem.rightBarButtonItem = saveButton
        
        view.backgroundColor = .white
        
    }
    
    @objc fileprivate func saveButtonPressed(_ sender: UIBarButtonItem) {
        if form.validate().isEmpty {
            _ = navigationController?.popViewController(animated: true)
        }
    }
    
    @objc fileprivate func deleteButtonPressed(_ sender: UIBarButtonItem) {
        
        let alert = UIAlertController(title: "Delete this item?", message: nil, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Cancel", style: .cancel)
        let delete = UIAlertAction(title: "Delete", style: .destructive) { [weak self] _ in
            self?.viewModel.delete()
            _ = self?.navigationController?.popViewController(animated: true)
        }
        alert.addAction(delete)
        alert.addAction(cancel)
        
        navigationController?.present(alert, animated: true, completion: nil)
    }

}

extension Selector {
    fileprivate static let saveButtonPressed = #selector(FieldViewController.saveButtonPressed(_:))
    fileprivate static let deleteButtonPressed = #selector(FieldViewController.deleteButtonPressed(_:))
}
