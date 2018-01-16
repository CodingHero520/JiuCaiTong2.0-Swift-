//
//  Invest_main_page.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/11.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Invest_main_page: UIScrollView,UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return self.cellNum!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = tableView.dequeueReusableCell(withIdentifier: "Invest_main_TableViewCellID", for: indexPath)
        
        cell.selectionStyle = .none
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 130
        
    }

    //定义一个全局的table
    public var myTable:UITableView?
    
    var leftSwip:UISwipeGestureRecognizer?
    
    var rightSwip:UISwipeGestureRecognizer?
    
    var index:Int?
    
    //定义一个闭包来控制器横线的滑动
    typealias line_move_block = (Int)->()
    
    var line_block :line_move_block?
    
    var cellNum:NSInteger?
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.cellNum = 10
        
        self.myTable = UITableView.init(frame: self.bounds, style: .plain)
        
        self.myTable?.delegate = self
        
        self.myTable?.dataSource = self
        
        self.myTable?.backgroundColor = RGBA(r: 237, g: 232, b: 246, a: 1)
        
        self.myTable?.contentInset = UIEdgeInsetsMake(10, 0, 0, 0)
        
        self.myTable?.register(UINib.init(nibName: "Invest_main_TableViewCell", bundle: nil), forCellReuseIdentifier: "Invest_main_TableViewCellID")
        
        self.myTable?.separatorStyle = .none
        
        if #available(iOS 11.0, *) {
            self.myTable?.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
        }
        
//        self.perform(#selector(reload), with: self, afterDelay: 2)
        
        
        index = 0
        
        self .addSubview(self.myTable!)
     
        //添加侧滑手势
        addLeftOrRightGesture()
    }
    @objc func reload() -> Void {
        
        self.cellNum = 10
        self.myTable?.reloadData()
        self.toTopAnimationWithTableView(tableview: self.myTable!)
    }
    
    //投资首页动画
    public func toTopAnimationWithTableView(tableview:UITableView)->Void{
        
        let cells:NSArray = tableview.visibleCells as NSArray
        
        let totalTime:TimeInterval = 0.95
        
        for cell in tableview.visibleCells {
            
            cell.transform = CGAffineTransform.init(translationX: 0, y: KScreenHeight)
            
            var indexItem:Int = (tableview.indexPath(for: cell)?.item)!
            
            UIView.animate(withDuration: 0.35, delay: TimeInterval(Double(indexItem) * (totalTime/Double(cells.count))), options: .curveEaseOut, animations: {
                
                cell.transform = CGAffineTransform.identity
                
            }, completion: nil)
            
        }
    }
    
    func addLeftOrRightGesture() -> Void {
        //添加左滑手势
        self.leftSwip = UISwipeGestureRecognizer.init(target: self, action: #selector(toLeftSwip))
        self.leftSwip?.direction = UISwipeGestureRecognizerDirection.left
        self.myTable?.addGestureRecognizer(self.leftSwip!)
        //添加右滑手势
        self.rightSwip = UISwipeGestureRecognizer.init(target: self, action: #selector(toRightSwip))
        self.rightSwip?.direction = UISwipeGestureRecognizerDirection.right
        self.myTable?.addGestureRecognizer(self.rightSwip!)
    
        //初始禁止向左滑动
        self.leftSwip?.isEnabled = false
        
        
    }
    
    //向左边滑动
    @objc func toLeftSwip() -> Void {
        
        addAnimation(isLeft: 1)
        
        index = index! - 1
        
        if index! < 2 {
            
            self.rightSwip?.isEnabled = true
        }
        
        if index! < 1 {
            
            self.leftSwip?.isEnabled = false
            
        }
       
        if self.line_block != nil{
            
            self.line_block!(index!)
        }
        
        //处理横线动画向左边滑动
    }
    //向右边滑动
    @objc func toRightSwip() -> Void {
        
        addAnimation(isLeft: 0)
        
        index = index! + 1
        
        //表示向👉右边滑动,开启向左👈侧滑的能力
        if index! > 0 {
            
            self.leftSwip?.isEnabled = true
            
        }
        
        //向左右👉滑动到最大限度时，关闭自己的策划的能力
        if index! > 1 {
            
            self.rightSwip?.isEnabled = false
            
            
        }
        //处理横线动画向右边滑动
        
        if self.line_block != nil{
            
            self.line_block!(index!)
        }
    }
    
    func addAnimation(isLeft:NSInteger) -> Void {
        
        let animation = CATransition();
        animation.duration = 0.4;
        animation.type = "push";
        if isLeft == 1{
            animation.subtype = kCATransitionFromRight;
       
        }else{
            animation.subtype = kCATransitionFromLeft;
    
        }
        self.myTable?.layer.add(animation, forKey: "transition");
        
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
