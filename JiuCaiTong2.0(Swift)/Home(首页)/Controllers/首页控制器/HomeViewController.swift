//
//  HomeViewController.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/26.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
import Masonry
class HomeViewController: UIViewController ,UIScrollViewDelegate{

    var MyTable :JCT_Home_MainTable?
    
    var AutoCycle :HomeBannerView?
    
    var MyTable_Footer :Home_Table_FooterView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //获取单利
//        let MyRequest:MyNetWorkRequestManager = MyNetWorkRequestManager.sharedInstace
//
//        let params:NSMutableDictionary = [:]
//        params .setValue("init", forKey: "act")
//
//        let usrStr = jct_urlStr()
//
//        MyRequest .RequestParams(url: usrStr as String, method: .RequestMethodPOST, params: params , success: { (obj) in
//
//            print("测试数据\(obj)")
//
//
//        }) { (error) in
//
//            print("错误信息\(error)")
//
//        }
       self.automaticallyAdjustsScrollViewInsets = false
       self.loadCycleView()
       self .setupAboutHomeBanner()
        
    }
    
    func setupAboutHomeBanner() -> Void {
        
       MyTable = JCT_Home_MainTable.init(frame: CGRect.init(x: 0, y: -20, width: KScreenWidth, height: KScreenHeight - 29), style: .plain)
       MyTable?.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
       MyTable?.contentOffset = CGPoint.init(x: 0, y: -200)
       MyTable?.addSubview(AutoCycle!)
       view.addSubview(MyTable!)
    
        MyTable_Footer = Bundle.main.loadNibNamed("Home_Table_FooterView", owner: self, options: nil)?.last as? Home_Table_FooterView
        
        MyTable?.tableFooterView = MyTable_Footer
        
      weak var weakSelf = self
        
      MyTable?.postBlock = {( yOff :CGFloat)->Void in
        
        var rect:CGRect = (weakSelf!.AutoCycle?.frame)!
        rect.origin.y = yOff
        rect.size.height = -yOff
        weakSelf?.AutoCycle?.frame = rect
        self.AutoCycle?.centerImage?.frame.size.height = -yOff
        self.AutoCycle?.centerImage?.frame.size.width = KScreenWidth + (-yOff - 200)*HWScale
        self.AutoCycle?.centerImage?.frame.origin.x = yOff+200

        } as? JCT_Home_MainTable.successBlock
        
        MyTable?.SwitchItemBlcok = {()->Void in
            
            self.tabBarController?.selectedIndex = 1
        }
    }

    func loadCycleView() {
        
    
        AutoCycle = HomeBannerView.init(frame: CGRect.init(x: 0, y: -200, width: KScreenWidth, height: 200))
    
    }
    
    

    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBar.isHidden = true
        
        AutoCycle?.startTimer()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "record_Home"), object: ["IO":"1"])
        NotificationCenter.default.post(name: NSNotification.Name(rawValue:"openAnimation"), object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        super.viewWillDisappear(animated)
        
        AutoCycle?.stopTimer()
        
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: "record_Home"), object: ["IO":"0"])
         NotificationCenter.default.post(name: NSNotification.Name(rawValue:"closeAnimation"), object: nil)
        
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
