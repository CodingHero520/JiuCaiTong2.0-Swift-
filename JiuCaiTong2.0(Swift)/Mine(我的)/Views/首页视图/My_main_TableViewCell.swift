//
//  My_main_TableViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/16.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class My_main_TableViewCell: UITableViewCell {

    
    @IBOutlet weak var my_main_cell_icon: UIImageView!
    
    @IBOutlet weak var my_mian_cell_label: UILabel!
    
    @IBOutlet weak var my_main_cell_seperatorline: UIView!
    
    @IBOutlet weak var my_main_cell_forward: UIImageView!
    
    //重写set方法
    var myDict:NSDictionary?{
        
        didSet{
            
            my_main_cell_icon.image = UIImage.init(named: myDict?.value(forKey: "img") as! String)
            my_mian_cell_label.text = myDict?.value(forKey: "name") as! String
            if myDict?.value(forKey: "hidden") as! String == "1" {
                
                my_main_cell_seperatorline.isHidden = true
                
            }else{
                
                my_main_cell_seperatorline.isHidden = false
            }
        }
        
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.selectionStyle = .none
        
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
