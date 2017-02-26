//
//  PinterViewController.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit
import AVFoundation

class PinterViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var data : [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10{
            let num = arc4random_uniform(3) + 1
            let image = UIImage(named: "image\(num)")!
            let charLen = arc4random_uniform(50) + 1
            let title = String.random(with : Int(charLen))
            let article = Article(title: title, image: image)
            
            self.data.append(article)
        }

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        if let layout = self.collectionView.collectionViewLayout as? PinterCollectionViewLayout {
            layout.delegate = self
        }
        
        self.collectionView.register(cellType: PinterCollectionViewCell.self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension PinterViewController: UICollectionViewDataSource{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(with: PinterCollectionViewCell.self, for: indexPath)
        
        cell.set(article: self.data[indexPath.row])
        
        return cell
    }
}

extension PinterViewController: UICollectionViewDelegate{
    
}

extension PinterViewController : PinterCollectionViewLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath: IndexPath,
                        withWidth width: CGFloat) -> CGFloat {
        let img = self.data[indexPath.item].image
        
        return PinterCollectionViewCell.imageHeightWith(image: img, width: width)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        heightForTitleAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat {
        let title = self.data[indexPath.item].title

        return PinterCollectionViewCell.titleHeightWith(title: title, width: width)
    }
}
