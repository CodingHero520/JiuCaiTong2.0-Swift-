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
    
    //执行切换UITabbarController
    typealias SwitchTabbarItem = ()->Void
    
    var SwitchItemBlcok :SwitchTabbarItem?
    
    
    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        self.backgroundColor = RGBA(r: 237, g: 242, b: 246, a: 1)
        self.delegate = self
        self.dataSource = self
        self.separatorStyle = .none
        self.separatorInset = UIEdgeInsetsMake(0, -10, 0, 0)
        self.register(UINib.init(nibName: "Home_News_TableViewCell", bundle: nil), forCellReuseIdentifier: "HomeNewsTableViewCellID")
        self.register(UINib.init(nibName: "Home_Cycle_Progress_TableViewCell", bundle: nil), forCellReuseIdentifier: "HomeCycleProgressTableViewCellID")
        
        self.register(UINib.init(nibName: "Home_ActivityEntry_TableViewCell", bundle: nil), forCellReuseIdentifier: "HomeActivityEntryTableViewCellID")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if indexPath.row == 0 {
            
            return 35
            
        }else if indexPath.row == 1{
            
            return 194
        
        }else{
            
            return 155
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCell(withIdentifier: "HomeNewsTableViewCellID")
            
            if cell == nil {
                cell = Home_News_TableViewCell(style: .default, reuseIdentifier: "HomeNewsTableViewCellID")
            }
            cell!.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell!
        }else if indexPath.row == 1{
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "HomeCycleProgressTableViewCellID")
            
            if cell == nil {
                
                cell = Home_Cycle_Progress_TableViewCell(style: .default, reuseIdentifier: "HomeCycleProgressTableViewCellID")
            }
            cell!.selectionStyle = UITableViewCellSelectionStyle.none
         
            return cell!
        }else{
            var cell = tableView.dequeueReusableCell(withIdentifier: "HomeActivityEntryTableViewCellID")
            
            if cell == nil {
                cell = Home_ActivityEntry_TableViewCell(style: .default, reuseIdentifier: "HomeActivityEntryTableViewCellID")
            }
            cell!.selectionStyle = UITableViewCellSelectionStyle.none
            
            return cell!
            
            
        }
    
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var yOff = scrollView.contentOffset.y+20;
       
        if yOff < -200 {
            
            if self.postBlock != nil {
                
                postBlock!(yOff)
            }
            
        }
        print("\(yOff)")
        if yOff > 0 {
            
            
            //切换到出借控制器
            if self.SwitchItemBlcok != nil{
             
                SwitchItemBlcok!()
                
            }
        }
    }
}
