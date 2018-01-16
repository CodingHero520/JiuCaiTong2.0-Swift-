//
//  Common.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/26.
//  Copyright © 2017年 baolei. All rights reserved.
//
import UIKit

//配置全屏的宽和高
let KScreenWidth = UIScreen.main.bounds.size.width
let KScreenHeight = UIScreen.main.bounds.size.height
let HWScale = KScreenHeight/KScreenWidth
let ipadScale = KScreenHeight/667

//判断当前的设备是ipad还是手机
func isPad(_:CGFloat) -> CGFloat{
    
    if UIDevice.current.model == "iPad" {
     
        return 200 * ipadScale
        
    }else{
        
        return 200
    }

}

func RGBA(r:CGFloat,g:CGFloat,b:CGFloat,a:CGFloat)->UIColor{
    
    return UIColor.init(red: r/255.0, green: g/255.0, blue: b/255.0, alpha: a)
    
}


func jct_urlStr() -> NSString {
    
    var url :NSString = ""
    
    #if DEBUG // 判断是否在测试环境下
        // TODO
        url = "https://jctwapcg.9caitong.com/mapi/index.php" //测试环境
        
    #else
        // TODO
        
        url = "https://wapcg.9caitong.com/mapi/index.php"   //正式环境
        
    #endif
    
    return url
}



