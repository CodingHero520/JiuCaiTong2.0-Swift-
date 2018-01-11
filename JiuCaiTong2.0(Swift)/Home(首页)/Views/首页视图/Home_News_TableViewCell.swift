//
//  Home_News_TableViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/2.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Home_News_TableViewCell: UITableViewCell {

    @IBOutlet weak var ScrollAdvertisment: UIScrollView!
    
    var moveView :UIView?
    
    var advertisement :UILabel?
    
    var advertimer :Timer?
    
    func startMyTimer() -> Void {

        self.advertimer = Timer.scheduledTimer(timeInterval: 8, target: self, selector: #selector(mytimerAction), userInfo: nil, repeats: true)
        RunLoop.main .add(self.advertimer!, forMode: .commonModes)
        
        
    }
    func stopMyTimer() -> Void {

        self.advertimer?.invalidate()
        self.advertimer = nil
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.ScrollAdvertisment.contentSize = CGSize.init(width: (KScreenWidth-80)*3, height: 35)
        
        self.ScrollAdvertisment.contentOffset = CGPoint.init(x: (KScreenWidth-80), y: 0)
        
        self.moveView = UIView.init(frame: CGRect.init(x:(KScreenWidth-80)*2, y: 0, width: KScreenWidth - 80, height: 35))
        
        self.ScrollAdvertisment.addSubview(self.moveView!)
        
        self.advertisement = UILabel.init()
        
        self.advertisement?.text = "当山峰没有棱角的时候"
        
        self.advertisement?.textAlignment = .left
        
        self.advertisement?.font = UIFont.systemFont(ofSize: 12)
        
        self.advertisement?.textColor = RGBA(r: 72, g: 96, b: 121, a: 1.0)
        
        self.moveView?.addSubview(self.advertisement!)
        
        self.advertisement!.mas_makeConstraints({ (make) in
            
            make?.left.mas_equalTo()(self.moveView?.mas_left)
            make?.centerY.mas_equalTo()(self.moveView?.mas_centerY)
            
        })
        
        mytimerAction()
        startMyTimer()
        
        NotificationCenter.default.addObserver(self, selector: #selector(Home_WillDisappear), name: NSNotification.Name(rawValue: "record_Home"), object: nil)
        
    }
    
    @objc func Home_WillDisappear(notice:Notification) -> Void {
        
        var user:NSDictionary = notice.object as! NSDictionary
        
        if user.object(forKey: "IO")as! String == "0" {
            
            stopMyTimer()
            
        }
        
        if user.object(forKey: "IO")as! String == "1" {
            
            startMyTimer()
            
        }
    }
    
    @objc func mytimerAction() -> Void {
        
        UIView.animate(withDuration: 5, animations: {
         
            self.moveView?.frame = CGRect.init(x: (KScreenWidth-80), y: 0, width: KScreenWidth - 80, height: 35)
            
        }) { (true) in
            
            UIView.animate(withDuration: 2, animations: {
                
                self.moveView?.frame = CGRect.init(x: 0, y: 0, width: KScreenWidth - 80, height: 35)
                
            }, completion: { (true) in
                
                self.moveView?.frame = CGRect.init(x: (KScreenWidth-80) * 2, y: 0, width: KScreenWidth - 80, height: 35)
            })
            
        }
        
       
        
    }

    deinit{
        
        //当界面销毁的时候，就移除通知
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "record_Home"), object: nil)
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
