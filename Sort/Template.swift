//
//  Template.swift
//  Sort
//
//  Created by 池翔 on 2017/6/10.
//  Copyright © 2017年 池翔. All rights reserved.
//
//let FieldType: [String] = [
//    "Text",
//    "Textarea",
//    "Number",
//    "Check",
//    "Boolean",
//    "Stepper",
//    "Date",
//    "Picker",
//    "Segmented",
//    "Slider",
//    "Image",
//    "Audio",
//    "Video",
//    "Url",
//    "Location",
//    "Email",
//    "Template",
//    "Accessory"
//]

import Foundation


class Template: Equatable {
    
    var templateName: String?
    var templateFields: [TemplateField]
    
    init(templateName: String? = nil,
         templateFields: [TemplateField] = []) {
        self.templateName = templateName
        self.templateFields = templateFields
    }
    
    public static func ==(lhs: Template, rhs: Template) -> Bool {
        return (lhs.templateName == rhs.templateName)
            && (lhs.templateFields == rhs.templateFields)
    }
    
}

class TemplateField: Equatable {
    
    var fieldName: String?
    fileprivate var fieldType_raw: String?
    var fieldItems: [FieldItem]
    
    init(fieldName: String? = nil,
        fieldType: String =  FieldType.text.rawValue,
        fieldItems: [FieldItem] = []) {
        self.fieldName = fieldName
        self.fieldType_raw = fieldType
        self.fieldItems = fieldItems
    }
    
    public static func ==(lhs: TemplateField, rhs: TemplateField) -> Bool {
        return (lhs.fieldName == rhs.fieldName)
            && (lhs.fieldType_raw == rhs.fieldType_raw)
            && (lhs.fieldItems == rhs.fieldItems)
    }
}

extension TemplateField {
    
    enum FieldType: String {
        case text = "Text"
        case picker = "Picker"
    }
}

extension TemplateField {
    
    var fieldType: FieldType {
        get {
            return FieldType(rawValue: self.fieldType_raw!)!
        }
        set {
            self.fieldType_raw = newValue.rawValue
        }
    }
}

class FieldItem: Equatable {
    
    var itemName: String?
    
    init(itemName: String? = nil) {
        self.itemName = itemName
    }
    
    public static func ==(lhs: FieldItem, rhs: FieldItem) -> Bool {
        return (lhs.itemName == rhs.itemName)
    }
}
