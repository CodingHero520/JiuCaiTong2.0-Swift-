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
        self.Invest_mynavigationbar.itemArray = ["车贷宝","餐饮贷","农户贷"]
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
    
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
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
