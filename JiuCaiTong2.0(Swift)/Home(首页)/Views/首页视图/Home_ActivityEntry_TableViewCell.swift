//
//  Home_ActivityEntry_TableViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/2.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Home_ActivityEntry_TableViewCell: UITableViewCell {

    @IBOutlet weak var left_top: UIView!
    
    @IBOutlet weak var left_bottom: UIView!
    
    @IBOutlet weak var right_top: UIView!
    
    @IBOutlet weak var right_bottom: UIView!
    
    @IBOutlet weak var left_top_main_label: UILabel!
    
    @IBOutlet weak var left_top_small_label: UILabel!
   
    @IBOutlet weak var left_top_image: UIImageView!
    
    @IBOutlet weak var right_top_main_label: UILabel!
    
    @IBOutlet weak var right_top_small_label: UILabel!
    
    @IBOutlet weak var right_top_image: UIImageView!
    
    @IBOutlet weak var left_bottom_main_label: UILabel!
    
    @IBOutlet weak var left_bottom_small_label: UILabel!
    
    @IBOutlet weak var left_bottom_image: UIImageView!
    
    @IBOutlet weak var right_bottom_main_label: UILabel!
    
    @IBOutlet weak var right_bottom_small_label: UILabel!
    
    @IBOutlet weak var right_bottom_image: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.left_top.layer.masksToBounds = true
        self.left_top.layer.cornerRadius = 4
        
        self.left_bottom.layer.masksToBounds = true
        self.left_bottom.layer.cornerRadius = 4
        
        self.right_top.layer.masksToBounds = true
        self.right_top.layer.cornerRadius = 4
        
        self.right_bottom.layer.masksToBounds = true
        self.right_bottom.layer.cornerRadius = 4
        
    }

    override var frame: CGRect{
        didSet{
            
            var newFrame = frame
            newFrame.origin.y += 10
            newFrame.size.height -= 10
            super.frame = newFrame
        }
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
