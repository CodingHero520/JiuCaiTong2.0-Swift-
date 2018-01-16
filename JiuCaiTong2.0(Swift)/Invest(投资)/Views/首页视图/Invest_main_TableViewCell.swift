//
//  Invest_main_TableViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/12.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Invest_main_TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.layer.masksToBounds = true
        self.layer.cornerRadius = 5
        
    }
    
    override var frame: CGRect{
        
        didSet{
            
            var newframe = frame
            newframe.origin.y -= 3
            newframe.size.height -= 6
            newframe.origin.x += 10
            newframe.size.width -= 20
            super.frame = newframe
            
            
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
