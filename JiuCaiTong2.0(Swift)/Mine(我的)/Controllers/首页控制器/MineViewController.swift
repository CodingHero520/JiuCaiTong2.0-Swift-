//
//  MineViewController.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/26.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit

class MineViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(self.my_main_table)
        
        weak var wealSelf = self
        
        //在添加一个参数，判断用户是否完成了3步走
        //如果没有完成3步走，就弹出一个引导图
        self.my_main_table.myscroll_block = {(off:CGFloat)->Void in
            
            var myrect:CGRect = (wealSelf?.my_header_view.frame)!
            myrect.origin.y = off
            myrect.size.height = -off-10
            wealSelf?.my_header_view.frame = myrect
        }
        
        //做一个数组，给cell赋值
        let my_main_array = [["img":"Icon_23","name":"资金详览","hidden":"0"],
                             ["img":"Icon_24","name":"出借记录","hidden":"0"],
                             ["img":"autoBorrow","name":"自动投标","hidden":"0"],
                             ["img":"borrow_manager","name":"借款管理","hidden":"0"],
                             ["img":"Icon_25","name":"优惠券","hidden":"0"],
                             ["img":"Icon_26","name":"安全中心","hidden":"0"],
                             ["img":"Icon_27","name":"设置","hidden":"1"],]
        
        self.my_main_table.my_table_array = my_main_array as NSArray
    }
    
    //懒加载主table
    lazy var my_main_table:My_main_tableview = {
        
        let mytable = My_main_tableview.init(frame: CGRect.init(x: 0, y: -20, width: KScreenWidth, height: KScreenHeight - 24), style: .plain)
        
        
        mytable.contentInset = UIEdgeInsetsMake(260, 0, 0, 0)
        
        mytable.contentOffset = CGPoint.init(x: 0, y: -260)
        
        mytable.addSubview(self.my_header_view)
        
        return mytable
        
    }()
    
    //懒加载顶部视图
    lazy var my_header_view:My_login_view = {
        
        let my_loginview = Bundle.main.loadNibNamed("My_login_view", owner: self, options: nil)?.last as! My_login_view
        
        my_loginview.frame = CGRect.init(x: 0, y: -260, width: KScreenWidth, height: 260)
        
        return my_loginview
    }()

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
