//
//  HomeBannerView.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/28.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit
import Masonry
class HomeBannerView: UIScrollView {

    //中间的图片
    var centerImage :UIImageView?

    var index :NSInteger?
    
    var pageContoller : UIPageControl?;
    //图片数组
    var urlImages :NSArray?
    //轮播图的定时器
    var myTimer :Timer?
    
    //关闭定时器
    func stopTimer() -> Void {
        
        self.myTimer?.invalidate()
        self.myTimer = nil
        
    }
    //开启定时器
    func startTimer() -> Void {
        
        self.myTimer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timeAction(time:)), userInfo: nil, repeats: true)
        //在下拉放大的过程中，也能触发定时器
        RunLoop.main .add(self.myTimer!, forMode: .commonModes)
        
    }
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        self.urlImages = ["http://pic.qyer.com/public/mobileapp/homebanner/2017/10/09/15075430688640/w800",
                    "http://pic.qyer.com/ra/img/15064476767054",
                    "http://pic.qyer.com/public/mobileapp/homebanner/2017/10/09/15075432049166/w800",
                    "http://pic.qyer.com/public/mobileapp/homebanner/2017/10/10/15076301267252/w800"
        ]
        
        index = 0
        
        centerImage = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: isPad(200)))
        centerImage?.sd_setImage(with: NSURL.init(string:self.urlImages?.firstObject as! String) as! URL, placeholderImage: nil, options: .retryFailed, completed: nil)
        centerImage?.isUserInteractionEnabled = true
        addSubview(centerImage!)
        
        addSwipGesture()
        addPageController()
        
        
    }
    
    //添加pageController
    func addPageController(){
        pageContoller = UIPageControl.init()
        pageContoller?.numberOfPages = (urlImages?.count)!;
        pageContoller?.currentPage = 0;
        pageContoller?.pageIndicatorTintColor = UIColor.orange;
        pageContoller?.currentPageIndicatorTintColor = UIColor.white;
        addSubview(pageContoller!);
       
        pageContoller!.mas_makeConstraints({ (make) in
            
            make?.right.mas_equalTo()(self.centerImage?.mas_right)
            make?.left.mas_equalTo()(self.centerImage?.mas_left)
            make?.height.mas_equalTo()(30)
            make?.bottom.mas_equalTo()(self.centerImage?.mas_bottom)
            
        })
    }
    
    //添加手势
    func addSwipGesture(){
        
        let leftSwip = UISwipeGestureRecognizer(target: self, action: #selector(swipAction(swip:)));
        leftSwip.direction = UISwipeGestureRecognizerDirection.left;
        self.centerImage?.addGestureRecognizer(leftSwip);
        
        let rightSwip = UISwipeGestureRecognizer(target: self, action:  #selector(swipAction(swip:)));
        rightSwip.direction = UISwipeGestureRecognizerDirection.right;
        self.centerImage?.addGestureRecognizer(rightSwip);
        
    }
    
    //计时器调用的方法
    @objc func timeAction(time:Timer){
    
        leftAnimationAction()
    }
    //手势调用的方法
    @objc func swipAction(swip:UISwipeGestureRecognizer){
        
        if swip.direction == UISwipeGestureRecognizerDirection.left{
            leftAnimationAction();
        }else if swip.direction == UISwipeGestureRecognizerDirection.right{
            rightAnimationAction();
        }
        
    }
    //左划方法
    func leftAnimationAction(){
        index = index! + 1;
        if index! > (urlImages?.count)! - 1{
            self.index = 0;
        }
        self.centerImage?.sd_setImage(with: NSURL.init(string: urlImages![index!] as! String) as! URL, placeholderImage: nil, options: .retryFailed, completed: nil)
        addAnimation(isLeft: 1);
        
    }
    //右划方法
    func rightAnimationAction(){
        
        index = index! - 1;
        if index! < 0{
            self.index = (urlImages?.count)! - 1;
        }
        self.centerImage?.sd_setImage(with: NSURL.init(string: urlImages![index!] as! String) as! URL, placeholderImage: nil, options: .retryFailed, completed: nil)
        addAnimation(isLeft: 0);
        
    }
    //添加动画
    func addAnimation(isLeft : NSInteger){
        let animation = CATransition();
        animation.duration = 0.4;
        animation.type = "push";
        if isLeft == 1{
            animation.subtype = kCATransitionFromRight;
        }else{
            animation.subtype = kCATransitionFromLeft;
        }
        self.centerImage?.layer.add(animation, forKey: "transition");
        
        pageContoller?.currentPage = index!;
        
    }
    
   
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
    }
    

}
