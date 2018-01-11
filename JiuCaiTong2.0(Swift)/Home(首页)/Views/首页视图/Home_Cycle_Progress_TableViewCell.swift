//
//  Home_Cycle_Progress_TableViewCell.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/2.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Home_Cycle_Progress_TableViewCell: UITableViewCell {
    
    @IBOutlet weak var CycleProgressSuper: UIView!
    
    var cycle:CycleProgress?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        cycle = CycleProgress.init(frame:CGRect.init(x: 0, y: 0, width: 160, height: 160))
        
        cycle?.backgroundColor = UIColor.white
        
        self.CycleProgressSuper.addSubview(cycle!)
        
        self.CycleProgressSuper.insertSubview(cycle!, at: 0)
        
        DispatchQueue.main.asyncAfter(deadline:.now() + TimeInterval(0)) {
            
            self.cycle?.setProgress((self.cycle?.progress)!+80, animated: true)
            
        }
        //添加一个通知，监听home界面出现
        NotificationCenter.default.addObserver(self, selector: #selector(openCycle), name: NSNotification.Name(rawValue: "openAnimation"), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(closeCycle), name: NSNotification.Name(rawValue: "closeAnimation"), object: nil)
        
    }
    @objc func closeCycle() -> Void {
        
        DispatchQueue.main.asyncAfter(deadline:.now() + TimeInterval(0)) {

           self.cycle?.setProgress(0, animated: true)
            
        }
        
    }
    @objc func openCycle() -> Void {
        
        DispatchQueue.main.asyncAfter(deadline:.now() + TimeInterval(0.0)) {
            
            self.cycle?.setProgress((self.cycle?.progress)!+80, animated: true)
            
        }
        
    }
    
    deinit {
        
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "openAnimation"), object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name(rawValue: "closeAnimation"), object: nil)
    }
    
    override var frame: CGRect{
        didSet{
            
            var newFrame = frame
            newFrame.origin.y += 1
            newFrame.size.height -= 1
            super.frame = newFrame
        }
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
