//
//  TemplateViewCell.swift
//  Sort
//
//  Created by 池翔 on 2017/6/10.
//  Copyright © 2017年 池翔. All rights reserved.
//

import UIKit

class TemplateListTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
