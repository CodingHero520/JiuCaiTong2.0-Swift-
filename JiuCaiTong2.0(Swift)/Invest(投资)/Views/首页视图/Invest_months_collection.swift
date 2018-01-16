//
//  Invest_months_collection.swift
//  JiuCaiTong2.0(Swift)
//
//  Created by 包磊 on 2018/1/11.
//  Copyright © 2018年 baolei. All rights reserved.
//

import UIKit

class Invest_months_collection: UICollectionView,UICollectionViewDataSource,UICollectionViewDelegate {
    
    let months_array = ["全部","1个月","3个月","6个月","12个月"]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.months_array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        //获取当前点击到的cell
        
        for i in 0...self.months_array.count{
            
            var myindexPath:IndexPath = IndexPath.init(row: i, section: 0)
            
            var cell = collectionView.cellForItem(at: myindexPath)
            
            
            if myindexPath.item == indexPath.item {
                
                cell?.backgroundView?.isHidden = false
                
            }else{
                
                cell?.backgroundView?.isHidden = true
            }
            
        }
        print("点击了\(indexPath.item)")
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath) as! Invest_months_CollectionViewCell
        
        cell.month_label?.text = self.months_array[indexPath.item]
        
        cell.backgroundView?.isHidden = true
        
        //默认第一个呗选中
        if indexPath.item == 0 {
            
            cell.backgroundView?.isHidden = false
            
        }
        
        return cell
        
    }
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        
        super.init(frame: frame, collectionViewLayout: layout)
        
        self.delegate = self
        self.dataSource = self
        self.register(Invest_months_CollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
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
