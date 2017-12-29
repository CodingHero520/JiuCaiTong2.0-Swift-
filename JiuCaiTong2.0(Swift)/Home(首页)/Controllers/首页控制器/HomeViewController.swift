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
        
       MyTable = JCT_Home_MainTable.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - 49), style: .plain)
       MyTable?.contentInset = UIEdgeInsetsMake(200, 0, 0, 0)
       MyTable?.contentOffset = CGPoint.init(x: 0, y: -200)
       MyTable?.addSubview(AutoCycle!)
       view.addSubview(MyTable!)
    
        
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
    }

    func loadCycleView() {
        
        let urls = ["http://pic.qyer.com/public/mobileapp/homebanner/2017/10/09/15075430688640/w800",
                    "http://pic.qyer.com/ra/img/15064476767054",
                    "http://pic.qyer.com/public/mobileapp/homebanner/2017/10/09/15075432049166/w800",
                    "http://pic.qyer.com/public/mobileapp/homebanner/2017/10/10/15076301267252/w800"
        ]
    
        AutoCycle = HomeBannerView.init(frame: CGRect.init(x: 0, y: -200, width: KScreenWidth, height: 200))
        
        AutoCycle?.backgroundColor = UIColor.green

        
    
    }
    
    

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
