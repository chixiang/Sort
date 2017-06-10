//
//  TemplateListViewModel.swift
//  Sort
//
//  Created by 池翔 on 2017/6/10.
//  Copyright © 2017年 池翔. All rights reserved.
//

import Foundation

extension TemplateListViewController {
    
    class ViewModel {
        
        var templates: [Template]
        
        var numberOfTemplates: Int {
            print("共有 " + templates.count.description + " 个模版")
            return templates.count
        }
        
        private func template(at index: Int) -> Template {
            return templates[index]
        }
        
        func templateName(at index: Int) -> String {
            return template(at: index).templateName ?? ""
        }
        
        func editViewModel(at index: Int) -> TemplateViewController.ViewModel {
            let template = self.template(at: index)
            let editViewModel = TemplateViewController.ViewModel(template: template)
            return editViewModel
        }
        
        func addViewModel() -> TemplateViewController.ViewModel {
            let template = Template()
            templates.append(template)
            let addViewModel = TemplateViewController.ViewModel(template: template)
            return addViewModel
        }
        
        @objc private func removeTemplate(_ notification: Notification) {
            guard let userInfo = notification.userInfo,
                let template = userInfo[Notification.Name.deleteTemplateNotification] as? Template,
                let index = templates.index(of: template) else {
                    return
            }
            templates.remove(at: index)
        }
        
        init(templates: [Template] = []) {
            self.templates = templates
            NotificationCenter.default.addObserver(self, selector: #selector(removeTemplate(_:)), name: .deleteTemplateNotification, object: nil)
        }
        
        deinit {
            NotificationCenter.default.removeObserver(self)
        }

    }
}

