//
//  Invest_navigationbar_scroll.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/10.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit
import Masonry
class Invest_navigationbar_scroll: UIView,UICollectionViewDelegate,UICollectionViewDataSource {
    
    @IBOutlet weak var SwitchUpDown: UIButton!
    //标题数组 全部,3个月,6个月,12个月...
    public var itemArray : NSArray?
    
    var item_label :UILabel?
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return (self.itemArray?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Home_navigationbar_CollectionViewCellID", for: indexPath)
        
        let mylabel = UILabel.init()
        mylabel.text = "--"
        mylabel.textColor = UIColor.white
        mylabel.textAlignment = .center
        mylabel.font = UIFont.systemFont(ofSize: 15)
        cell.contentView.addSubview(mylabel)
        mylabel.mas_makeConstraints { (make) in
            
            make?.center.mas_equalTo()(cell)
            make?.size.mas_equalTo()(cell)

        }
        mylabel.text = self.itemArray?[indexPath.item] as! String
        
        //移动线的开始的位置
        if indexPath.item == 0 {
            
            self.moveline.frame = CGRect.init(x:cell.frame.maxX - (cell.frame.maxX - 30)/2 - 30 , y: 21, width: 30 , height: 3)
            
        }
        
        return cell
        
    }
    
    //懒加载一个collectionview视图
    lazy var mycolltionview:UICollectionView = {
        let myrect :CGRect = CGRect.init(x: 10, y: 49, width: KScreenWidth - 60, height: 25)
        let itemScroll = UICollectionView.init(frame:myrect , collectionViewLayout:self.myitem)
        itemScroll.delegate = self
        itemScroll.dataSource = self
        itemScroll.register(UINib.init(nibName: "Home_navigationbar_CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Home_navigationbar_CollectionViewCellID")
        self.addSubview(itemScroll)
        return itemScroll
        
    }()
    
    
    lazy var myitem:UICollectionViewFlowLayout = {
       
        let item = UICollectionViewFlowLayout()
        
        var mycount:Int = (self.itemArray?.count)!
        
        //如果个数少于4个就平分
        if mycount <= 4{
            item.itemSize = CGSize.init(width: (KScreenWidth - 60)/CGFloat(mycount), height: 17)
        }else{
            item.itemSize = CGSize.init(width: (KScreenWidth - 60)/4, height: 17)
        }
        
        item.minimumLineSpacing = 0
        item.minimumInteritemSpacing = 0
        return item
    }()
    
    //懒加载一个
    public lazy var moveline:UIView = {
        
        let lineview = UIView.init()
        lineview.backgroundColor = UIColor.white
        lineview.layer.masksToBounds = true
        lineview.layer.cornerRadius = 1.5
        self.mycolltionview.addSubview(lineview)
        return lineview
    }()
    
    override func draw(_ rect: CGRect) {
        
        super.draw(rect)
        
        self.mycolltionview.backgroundColor = UIColor.clear
        
        //点击上下切换按钮
        self.SwitchUpDown .addTarget(self, action: #selector(clickupdowm), for: .touchUpInside)
    }
 
    @objc func clickupdowm() -> Void {
        
        self.SwitchUpDown.isSelected = !self.SwitchUpDown.isSelected
        
        if self.SwitchUpDown.isSelected == true {
            
            
            
        }
        
        
        
    }
    
    

}
