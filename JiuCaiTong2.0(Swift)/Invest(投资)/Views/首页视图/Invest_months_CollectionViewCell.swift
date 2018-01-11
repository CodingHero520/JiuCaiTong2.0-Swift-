//
//  Invest_months_CollectionViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/11.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Invest_months_CollectionViewCell: UICollectionViewCell {
    
    public var month_label:UILabel?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.month_label = UILabel.init(frame: self.bounds)
        
        self.month_label?.font = UIFont.systemFont(ofSize: 15)
        
        self.month_label?.textColor = UIColor.black
        
        self.month_label?.textAlignment = .center
        
        self.backgroundColor = UIColor.white
        
        self.addSubview(self.month_label!)
        
        let cellBackView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth/5-30, height: 30))
        
        cellBackView.center = self.center
        
        cellBackView.image = UIImage.init(named: "selectButton.png")
        
        self.backgroundView = cellBackView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
