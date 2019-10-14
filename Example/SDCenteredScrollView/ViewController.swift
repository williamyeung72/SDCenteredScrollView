//
//  ViewController.swift
//  SDCenteredScrollView
//
//  Created by William Yeung on 10/14/2019.
//  Copyright (c) 2019 William Yeung. All rights reserved.
//

import UIKit
import SDCenteredScrollView

class ViewController: UIViewController {
    
    fileprivate var currentPage: Int = 0 {
        didSet {
            print("Current Page:\(currentPage)")
        }
    }
    
    fileprivate var cardSize: CGSize {
        let layout = collectionView.collectionViewLayout as! SDCenteredCollectionViewLayout
        var cardSize = layout.itemSize
        cardSize.width =  cardSize.width + layout.minimumLineSpacing
        return cardSize
    }
    
    private var collectionView: UICollectionView = {
        
        let flowLayout = SDCenteredCollectionViewLayout()
        flowLayout.scrollDirection = .horizontal
        flowLayout.itemSize = CGSize(width: 100, height: 100)
        
        flowLayout.minimumLineSpacing = 10//default = 10
        flowLayout.standardItemAlpha = 0.5//default = 1
        flowLayout.standardItemScale = 0.8//defaul = 1
        
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .clear
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            collectionView.heightAnchor.constraint(equalToConstant: 200),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor)
            
        ])
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.backgroundColor = .systemGray
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        
        let leftEdgeInsets = collectionView.frame.size.width / 2 - ((self.cardSize.width) / 2)
        let rightEdgeInsets = collectionView.frame.size.width / 2 - ((self.cardSize.width) / 2)
        
        return UIEdgeInsets(top: 0, left: leftEdgeInsets, bottom: 0, right: rightEdgeInsets);
    }
    
}

extension ViewController:UIScrollViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let carSide =  self.cardSize.width
        let offset =  scrollView.contentOffset.x
        currentPage = Int(floor((offset - carSide / 2) / carSide) + 1)
    }
}
