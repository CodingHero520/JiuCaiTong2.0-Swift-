//
//  InvestViewController.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/26.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit

class InvestViewController: UIViewController {

    //顶部的视图，滑来滑去的
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view .addSubview(self.Invest_mynavigationbar)
        self.view .addSubview(self.Invest_collection)
        self.view .addSubview(self.myInvest_main_page)
        self.Invest_mynavigationbar.itemArray = ["车贷宝","餐饮贷","农户贷"]

        //bool 控制开还是关
        self.Invest_mynavigationbar.Invest_Switch_Block = {(On_or_Off:Bool)->Void in
            
            if On_or_Off == true {
                
                UIView.animate(withDuration: 0.35, animations: {
                    
                    self.Invest_collection.frame = CGRect.init(x: 0, y: self.Invest_mynavigationbar.frame.maxY, width: KScreenWidth, height: 0)
                    self.myInvest_main_page.frame = CGRect.init(x: 0, y: self.Invest_mynavigationbar.frame.maxY, width: KScreenWidth, height: KScreenHeight - 80 - 44)
                    self.myInvest_main_page.myTable?.frame.size = self.myInvest_main_page.frame.size
                })
              
                
            }else{

                UIView.animate(withDuration: 0.35, animations: {
                    
                    self.Invest_collection.frame = CGRect.init(x: 0, y: self.Invest_mynavigationbar.frame.maxY, width: KScreenWidth, height: 40)
                    self.myInvest_main_page.frame = CGRect.init(x: 0, y: self.Invest_collection.frame.maxY, width: KScreenWidth, height: KScreenHeight - 80 - 44 - 40)
                    
                    self.myInvest_main_page.myTable?.frame.size = self.myInvest_main_page.frame.size
                })
                
              
            }
            
        }
        
        
        self.myInvest_main_page.line_block = {(move_index:Int)->() in
           
            if move_index == 0 {
             
                UIView.animate(withDuration: 0.35, animations: {
                    
                    self.Invest_mynavigationbar.moveline.frame = CGRect.init(x:((KScreenWidth - 60)/3-30)/2 , y: 21, width: 30 , height: 3)
                    
                })
                
            }
            
            if move_index == 1 {
                
                UIView.animate(withDuration: 0.35, animations: {
                    
                    self.Invest_mynavigationbar.moveline.frame = CGRect.init(x:(KScreenWidth - 60)/2-15 , y: 21, width: 30 , height: 3)
                    
                })
                
            }
            
            if move_index == 2 {
                
                UIView.animate(withDuration: 0.35, animations: {

                    self.Invest_mynavigationbar.moveline.frame = CGRect.init(x:5*(KScreenWidth - 60)/6-15, y: 21, width: 30 , height: 3)
                })
            }
        }
    }
    
   
    //懒加载，延迟加载
    lazy var Invest_mynavigationbar :Invest_navigationbar_scroll = {
        
        let mynavigationbar = Bundle.main.loadNibNamed("Invest_navigationbar_scroll", owner: self, options: nil)?.last
        
        return mynavigationbar as! Invest_navigationbar_scroll
        
    }()
    
    //懒加载 对象size
    lazy var months_layout:UICollectionViewFlowLayout = {
        
        let mylayout = UICollectionViewFlowLayout.init()
        
        mylayout.itemSize = CGSize.init(width: (KScreenWidth - 60)/5, height: 30)
        
        mylayout.minimumLineSpacing = 0
        
        mylayout.minimumInteritemSpacing = 10
        
        mylayout.sectionInset = UIEdgeInsetsMake(5, 0, 0, 0)
        
        return mylayout
        
    }()
    
    //懒加载，月份
    lazy var Invest_collection:Invest_months_collection = {
        
        let myrect:CGRect = CGRect.init(x: 0, y: self.Invest_mynavigationbar.frame.maxY, width: KScreenWidth, height: 40)
        
       let my_months_collection = Invest_months_collection.init(frame: myrect, collectionViewLayout: self.months_layout)
        
        my_months_collection.backgroundColor = UIColor.white
        
        
        return my_months_collection
    }()
    
    //懒加载主页控制器
    lazy var myInvest_main_page:Invest_main_page = {
        
        let mypage = Invest_main_page.init(frame: CGRect.init(x: 0, y: self.Invest_collection.frame.maxY, width: KScreenWidth, height: KScreenHeight - 80 - 49 - 44))
        
        return mypage
        
        
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        self.myInvest_main_page.myTable?.reloadData()
        self.myInvest_main_page.toTopAnimationWithTableView(tableview: self.myInvest_main_page.myTable!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
