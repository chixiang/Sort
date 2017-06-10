//
//  FieldViewModel.swift
//  Sort
//
//  Created by 池翔 on 2017/6/10.
//  Copyright © 2017年 池翔. All rights reserved.
//

import Foundation

extension FieldViewController {
    
    class ViewModel {
        
        private let templateField: TemplateField
        
        var fieldName: String? {
            get {
                return templateField.fieldName
            }
            set {
                templateField.fieldName = newValue
            }
        }
        
        let fieldTypeOptions: [String] = [TemplateField.FieldType.text.rawValue,
                                          TemplateField.FieldType.picker.rawValue]
        
        var fieldType: String? {
            get {
                return templateField.fieldType.rawValue
            }
            set {
                if let value = newValue {
                    templateField.fieldType = TemplateField.FieldType(rawValue: value)!
                }
            }
        }
        
        init(templateField: TemplateField) {
            self.templateField = templateField
        }
        
        func delete() {
            NotificationCenter.default.post(name: .deleteTemplateFieldNotification, object: nil, userInfo: [ Notification.Name.deleteTemplateFieldNotification : templateField ])
        }
    }
}

extension Notification.Name {
    static let deleteTemplateFieldNotification = Notification.Name("delete template field")
}
