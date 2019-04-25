//
//  MenuBar.swift
//  WirelessSupport
//
//  Created by Alan Lam on 2019-04-05.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class MenuBar: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    // creating the actually menubar itself w/ UICollectionView
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = self.menuColor
        cv.dataSource = self
        cv.delegate = self
        return cv
    }()

    let cellId = "cellId"
    let menuItems = ["telus", "bell", "rogers", "fido"]
    
    var prevSelected: IndexPath?
    var currSelected: Int?
    var menuColor = UIColor(red: 224/255, green: 224/255, blue: 224/255, alpha: 1)
    
    var ConsumerVC: ConsumerViewController?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        collectionView.register(MenuCell.self, forCellWithReuseIdentifier: cellId)
        
        currSelected = 0
        addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: collectionView, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .top, relatedBy: .equal, toItem: self, attribute: .top, multiplier: 1, constant: 0),
            NSLayoutConstraint(item: collectionView, attribute: .leading, relatedBy: .equal, toItem: self, attribute: .leading, multiplier: 1, constant: 0)
        ])
    }
    
// determine the amount of item in menubar
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MenuCell
        // default background: clear
        
        // grey out non-selected items
        cell.imageView.image = UIImage(named: menuItems[indexPath.item])
        
        if currSelected == indexPath.item {
            cell.backgroundColor = UIColor.white
        }
        else {
            cell.backgroundColor = menuColor
        }
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        currSelected = indexPath.item
        ConsumerVC?.scrollToMenuIndex(menuIndex: indexPath.item)
        print(indexPath.item)
        collectionView.reloadData()
    }
    
// align cells evenly
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.width / 4, height: frame.height-3)
    }
    
// remove the gap between cells
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MenuCell: UICollectionViewCell {
    let imageView: UIImageView = {
        let iv = UIImageView()
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    func setupView() {
        addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        addConstraints([
            NSLayoutConstraint(item: imageView, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 0),
            NSLayoutConstraint(item: imageView, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 0)
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
