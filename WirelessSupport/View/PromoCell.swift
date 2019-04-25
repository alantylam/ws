//
//  PromoCell.swift
//  WirelessSupport
//
//  Created by Alan Lam on 2019-04-09.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class PromoCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.dataSource = self
        cv.delegate = self
        
        return cv
    }()
    
    let cellId = "cellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.backgroundColor = .white
        addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: collectionView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: -2),
            NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 1)
            ])
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.showsVerticalScrollIndicator = true
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        
        cell.backgroundColor = .lightGray
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height/5)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
