//
//  My_login_view.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/15.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class My_login_view: UIView {
    
    @IBOutlet weak var RegisterButton: UIButton!
    
    @IBOutlet weak var LoginButton: UIButton!
    
    
    override func draw(_ rect: CGRect) {
    
        self.RegisterButton.layer.masksToBounds = true
        self.RegisterButton.layer.cornerRadius = 3
        
        self.LoginButton.layer.masksToBounds = true
        self.LoginButton.layer.cornerRadius = 3
        
        
    }
    

}
