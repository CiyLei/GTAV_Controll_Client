//
//  CellController.swift
//  gtav_test
//
//  Created by ChenLei on 16/12/4.
//  Copyright © 2016年 ChenLei. All rights reserved.
//

import UIKit

class CellController: UITableViewCell {
    
    var label_text:UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        label_text = UILabel(frame: CGRect(x:15, y:0, width:self.contentView.frame.width - 65, height:self.contentView.frame.height))
        label_text.numberOfLines = 0
        
        self.contentView.addSubview(label_text)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // 类方法 重用标识符
    class func cellID () -> String {
        return "CustomWriteCell"
    }
}
