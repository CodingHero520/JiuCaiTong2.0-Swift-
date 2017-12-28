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
class HomeViewController: UIViewController {

    var imageview :UIImageView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //获取单利
        let MyRequest:MyNetWorkRequestManager = MyNetWorkRequestManager.sharedInstace

        let params:NSMutableDictionary = [:]
        params .setValue("find", forKey: "act")

        let usrStr = "https://jctwapcg.9caitong.com/mapi/index.php"

        MyRequest .RequestParams(url: usrStr, method: .RequestMethodPOST, params: params , success: { (obj) in

            print("测试数据\(obj)")


        }) { (error) in

            print("错误信息\(error)")

        }

       
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
