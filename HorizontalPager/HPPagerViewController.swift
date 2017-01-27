//
//  HPPagerViewController.swift
//  HorizontalPager
//
//  Created by edaluz on 1/26/17.
//  Copyright © 2017 edaluz. All rights reserved.
//

import UIKit

class HPPagerViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView : UICollectionView!
    
    fileprivate let numberOfItems: CGFloat = 10
    fileprivate let itemsPerRow: CGFloat = 1
    fileprivate let sectionInsets = UIEdgeInsets(top: 0.0, left: 50.0, bottom: 20.0, right: 50.0)
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.collectionView.register(UINib.init(nibName: "ImageCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "ImageCollectionViewCell")
    

    }

    
    //PRAGMA MARK: UICollectionViewDataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int
    {
        return  10
    }
    
    func collectionView(_ collectionView: UICollectionView,numberOfItemsInSection section: Int) -> Int
    {
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView,cellForItemAt indexPath: IndexPath) -> UICollectionViewCell
    {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell",for: indexPath) as! ImageCollectionViewCell
        cell.imageView.image = UIImage.init(named: "emptyCity")
        // Configure the cell
        return cell
    }

    ////////////////////////////
    
    
    //Collection view delegate
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize
    {
        //2
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = self.view.frame.width - 100
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: self.collectionView.frame.size.height)
    }
    
    //3
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets
    {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize
    {
        return CGSize.zero
    }
    
    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,minimumLineSpacingForSectionAt section: Int) -> CGFloat
    {
        return sectionInsets.left
    }
}
