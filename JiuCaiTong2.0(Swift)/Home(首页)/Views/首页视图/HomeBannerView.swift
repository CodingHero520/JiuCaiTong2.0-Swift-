//
//  HomeBannerView.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/28.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit

class HomeBannerView: UIScrollView {

    //中间的图片
    var centerImage :UIImageView?
    //左侧的图片
    var leftImage :UIImageView?
    //右侧的图片
    var rightImage :UIImageView?
    //图片数组
    var urlImages :NSArray?
    //轮播图的定时器
    var myTimer :Timer?
    
    //关闭定时器
    func stopTimer() -> Void {
        
        
    }
    //开启定时器
    func startTimer() -> Void {
        
        
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        centerImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: 200))
        centerImage?.sd_setImage(with: NSURL.init(string: "http://pic.qyer.com/ra/img/15064476767054") as! URL, placeholderImage: nil, options: .retryFailed, completed: nil)
        
        addSubview(centerImage!)
        
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
    }
    

}
