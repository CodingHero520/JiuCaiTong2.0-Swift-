//
//  AppDelegate.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2017/12/25.
//  Copyright © 2017年 baolei. All rights reserved.
//

import UIKit
import SDWebImage
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    //启动图加载之后的广告图片
    var advertisementImageView: UIImageView?
    //承载广告图片的父视图
    var advertisementImageViewSuperView :UIImageView?
    
    var advertisementUrl:String?
    

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        self.window = UIWindow.init(frame: UIScreen.main.bounds)

        self.window?.rootViewController = MyTabBarViewController()
        
        self.window?.makeKeyAndVisible()
        
        self .loadAdvertismentImage()
        //https://oss.9caitong.com/Ossimg/2017/07/21/10/59716c5f87c72.jpg
        return true
    }

    func loadAdvertismentImage() -> Void {
        
        let str:String = self.getLauchImage() //获取到的启动图的图片:LaunchImage-800-667h
    
        self.advertisementImageViewSuperView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight))
        
        self.advertisementImageViewSuperView?.backgroundColor = UIColor.blue
        
        self.advertisementImageViewSuperView?.image = UIImage.init(named: str)
  
        self.advertisementImageView = UIImageView.init(frame: CGRect.init(x: 0, y: 0, width: KScreenWidth, height: KScreenHeight - 150))
        
        let ImageManager = SDWebImageManager.init()
        
        ImageManager.imageDownloader?.downloadTimeout = 4
        
        weak var weakSelf = self
        
        self.advertisementImageView?.sd_setImage(with: NSURL.init(string: "https://oss.9caitong.com/Ossimg/2017/07/21/10/59716c5f87c72.jpg")! as URL, placeholderImage: nil, options: .retryFailed, completed:{(image,error, cache,url) in
          
            if image == nil {

            
                weakSelf?.removeAdvertisementView()
            }else{

                //异步延迟加载方法1
//                weakSelf?.perform(#selector(self.removeAdvertisementView), with: self, afterDelay: 4)
            
                
                //2
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()+4, execute: {
                    
                    self.removeAdvertisementView()
                    
                })
                
            }
            
        })
        
         self.advertisementImageViewSuperView?.addSubview(self.advertisementImageView!)
         self.window?.addSubview((self.advertisementImageViewSuperView)!)
         self.window?.bringSubview(toFront: self.advertisementImageViewSuperView!)
        
        
    }
    
    @objc func removeAdvertisementView() -> Void {
        
        self.advertisementImageView?.removeFromSuperview()
        self.advertisementImageView = nil

        self.advertisementImageViewSuperView?.removeFromSuperview()
        self.advertisementImageViewSuperView = nil
        
//
        let storyBoard:UIStoryboard = UIStoryboard.init(name: "Main", bundle: Bundle.main)
        
        self.window?.rootViewController = storyBoard.instantiateInitialViewController()
        
        self.window?.makeKeyAndVisible()
        
    }
    
    //获得系统的启动页的图片，用它来承载广告占位图
    
    func getLauchImage() -> String {
     
        let viewSize:CGSize = UIScreen.main.bounds.size
        
        let viewOrientation:String = "Portrait"
        
        var launchImage : String!
        
        launchImage = nil
        
        var imagesArr :Array<Any>!
        
        let imagedDict = Bundle.main.infoDictionary
        
        imagesArr = imagedDict!["UILaunchImages"] as! Array<Any>
        
        //遍历这个数组
        for i in 0...imagesArr.count-1{
            
            //as! 强制类型向下转换 as 1派生类转向基类 2消除二义性
            let dict:NSDictionary = imagesArr[i] as! NSDictionary
            
            let imageSize:CGSize = CGSizeFromString(dict["UILaunchImageSize"] as! String)
            
            if __CGSizeEqualToSize(imageSize, viewSize) && (viewOrientation == dict["UILaunchImageOrientation"] as! String) {
                
                
                launchImage = dict["UILaunchImageName"] as! String
            }
            
        }
        
        return launchImage
        
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

