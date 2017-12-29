//
//  JCT_Home_MainTable.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/29.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit

class JCT_Home_MainTable: UITableView,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate{
    
    typealias successBlock = (CGFloat) ->Void
    
    var postBlock :successBlock?
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 16
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "CELL")
        
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: "CELL")
        }
        cell!.selectionStyle = UITableViewCellSelectionStyle.none
        cell!.textLabel?.text = "111"
        
        return cell!
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var yOff = scrollView.contentOffset.y;
       
        if yOff < -200 {
            
            if self.postBlock != nil {
                
                postBlock!(yOff)
            }
            
        }
        print("\(yOff)")
    }
}
