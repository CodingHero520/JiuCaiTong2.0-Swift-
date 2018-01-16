//
//  My_main_tableview.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/15.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class My_main_tableview: UITableView,UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate {
    
    typealias scroll_block = (CGFloat)->Void
    
    var myscroll_block:scroll_block?
    
    var my_table_array:NSArray?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return (my_table_array?.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:My_main_TableViewCell = tableView.dequeueReusableCell(withIdentifier: "My_main_TableViewCellID", for: indexPath) as! My_main_TableViewCell
        cell.selectionStyle = .none

        cell.myDict = my_table_array?.object(at: indexPath.row) as! NSDictionary
        return cell
        
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
        
    }

    override init(frame: CGRect, style: UITableViewStyle) {
        
        super.init(frame: frame, style: style)
        
        self.dataSource = self
        self.delegate = self
        self.separatorStyle = .none
        self.backgroundColor = RGBA(r: 237, g: 242, b: 246, a: 1)
        self .register(UINib.init(nibName: "My_main_TableViewCell", bundle: nil), forCellReuseIdentifier: "My_main_TableViewCellID")
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        var off:CGFloat = scrollView.contentOffset.y
   
        if off < -279 {
            
            if self.myscroll_block != nil {
                
            self.myscroll_block!(off)
                
            }
            
        }
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
