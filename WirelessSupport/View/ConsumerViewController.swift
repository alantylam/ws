//
//  ConsumerViewController.swift
//  WirelessSupport
//
//  Created by Alan Lam on 2019-04-05.
//  Copyright © 2019 Alan Lam. All rights reserved.
//

import UIKit

class ConsumerViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    lazy var menuBar: MenuBar = {
        let mb = MenuBar()
        mb.ConsumerVC = self
        return mb
    }()
    
    let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTheme()
        setupCV()
        setupMenuBar()
    }
    
    private func setupTheme() {
        // self.collectionView.backgroundColor = UIColor.white
        self.collectionView.backgroundColor = UIColor.white
        self.navigationItem.title = "Consumer Promotions"
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.isTranslucent = false
        // get rid of the shadow under navigation bar
        self.navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    private func setupCV() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PromoCell.self, forCellWithReuseIdentifier: cellId)
        collectionView.frame.size.height = collectionView.frame.size.height - 50
        collectionView.frame.origin.y = 50
        collectionView?.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
    }
    
    private func setupMenuBar() {
        
        menuBar.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(menuBar)
        
        // set the size of the Menu Bar
        view.addConstraints([
            NSLayoutConstraint(item: menuBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .width, multiplier: 1.0, constant: view.frame.width),
            NSLayoutConstraint(item: menuBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1.0, constant: 50),
            ])
    }
    
    func scrollToMenuIndex(menuIndex: Int) {
        let indexPath = IndexPath(item: menuIndex, section: 0)
        self.collectionView.scrollToItem(at: indexPath, at: UICollectionView.ScrollPosition(), animated: true)
    }
    
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        let index = Int(targetContentOffset.pointee.x/collectionView.frame.width)
        
        menuBar.currSelected = index
        let indexPath = IndexPath(item: index, section: 0)
        menuBar.collectionView.selectItem(at: indexPath, animated: false, scrollPosition: UICollectionView.ScrollPosition())
        menuBar.collectionView.reloadData()
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath)
        //let colors: [UIColor] = [.white, .green, .yellow, .lightGray, .black]
        cell.backgroundColor = .gray
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.size.width, height: collectionView.frame.size.height)
    }
}

