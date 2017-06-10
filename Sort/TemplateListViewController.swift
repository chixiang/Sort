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
    
    var viewModel: ViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        var templateNames = [String]()
        //        for index in 0..<viewModel.numberOfTemplates {
        //            templateNames.append(viewModel.templateName(at: index))
        //        }
        //
        //        form
        //            +++ templateNames.reduce(Section()) { (section, templateName) in
        //                section
        //                    <<< ButtonRow() {
        //                        $0.title = templateName
        //                        //                $0.presentationMode = .segueName(segueName: "TemplateViewControllerSegue", onDismiss: nil)
        //                        }.onCellSelection({ (cell, row) in
        //                            let editViewModel = viewModel.editViewModel(at: indexPath.row)
        //                            let editVC = TemplateViewController(viewModel: editViewModel)
        //                            navigationController?.pushViewController(editVC, animated: true)
        //                        })
        //        }
        
        form
            +++ Section()
        for index in 0..<viewModel.numberOfTemplates {
            form.last!
                <<< ButtonRow() {
                    $0.title = viewModel.templateName(at: index)
                    $0.presentationMode = nil
                    }.onCellSelection({ (cell, row) in
                        let editViewModel = self.viewModel.editViewModel(at: index)
                        let editVC = TemplateViewController(viewModel: editViewModel)
                        self.navigationController?.pushViewController(editVC, animated: true)
                    })
        }
    }
    
    convenience init(viewModel: ViewModel) {
        self.init()
        self.viewModel = viewModel
        initialize()
    }
    
    func initialize() {
        //        tableView.translatesAutoresizingMaskIntoConstraints = false
        //        view.addSubview(tableView)
        //        tableView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        //        tableView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //        tableView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        tableView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Navigation items
        navigationItem.title = "Template List"
        
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: .addButtonPressed)
        navigationItem.rightBarButtonItem = addButton
    }
    
    @objc fileprivate func addButtonPressed(_ sender: UIBarButtonItem) {
        let addViewModel = viewModel.addViewModel()
        let addVC = TemplateViewController(viewModel: addViewModel)
        navigationController?.pushViewController(addVC, animated: true)
    }
}

extension Selector {
    fileprivate static let addButtonPressed = #selector(TemplateListViewController.addButtonPressed(_:))
}

//extension TemplateListViewController: UITableViewDelegate {
//
//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        let editViewModel = viewModel.editViewModel(at: indexPath.row)
//        let editVC = TemplateViewController(viewModel: editViewModel)
//        navigationController?.pushViewController(editVC, animated: true)
//    }
//}

