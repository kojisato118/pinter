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

    let images = [
        "http://1.bp.blogspot.com/-d--Gz9YriqI/WGnPW5YIevI/AAAAAAABA40/UsETonRUT2Qg37f-fY1jotEW7KzDpsBJACLcB/s800/happy_schoolgirl.png",
        "http://3.bp.blogspot.com/-0PSkBmN0xoA/WIiB-0uYJzI/AAAAAAABBVs/YNDasC-1jVgbRpXjlyFybk24uB_Ts7F4gCLcB/s800/happy_schoolboy.png",
        "https://3.bp.blogspot.com/-WWS2NopOSpw/WGYjNvOu3eI/AAAAAAABAxM/UD9wmIUflrgJuXS1bIphGpVPZaTVyEbxwCLcB/s400/hyuohen_computer_internet.png",
        "http://2.bp.blogspot.com/-wO7nTrE8SjU/WGnPL3LBz_I/AAAAAAABA0k/Q_2XnnPguSMBsYAJrNLEuwR8YF_kjZHWgCLcB/s800/animal_buta_shock.png",
        "http://2.bp.blogspot.com/-c1RPv5EPu3I/WGnPbqwVbcI/AAAAAAABA6s/677pzcImf3YMk6PpfCgNfTTiXygpNBhyACLcB/s800/smartphone_neru_man.png",
        "http://1.bp.blogspot.com/-FSFqbqgA8wE/WD_ccIiEpFI/AAAAAAABAGI/p4wWCHN1B8o4TJzPFuwTowT0cFibxbMwACLcB/s800/writing_woman4_laugh.png",
        "http://1.bp.blogspot.com/-CrxO29Ez5ds/WD_cS16kJVI/AAAAAAABACY/LoD1WGhwkgAUrbOOkUyTIS8-cHqHuDM3wCLcB/s800/kosoado2_sore.png"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10{
            let num = Int(arc4random_uniform(UInt32(images.count)))
            let imageUrl = images[num]
            let charLen = arc4random_uniform(100) + 10
            let title = String.random(with : Int(charLen))
            let article = Article(title: title, imageUrl: imageUrl)
            
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
