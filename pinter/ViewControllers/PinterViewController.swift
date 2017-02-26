//
//  PinterViewController.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

class PinterViewController: UIViewController{
    @IBOutlet weak var collectionView: UICollectionView!
    
    fileprivate var data : [UIImage?] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10{
            let num = arc4random_uniform(3) + 1
            let image = UIImage(named: "image\(num)")
            self.data.append(image)
        }

        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
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
        
        
        cell.set(image: self.data[indexPath.row])
        
        return cell
    }
}

extension PinterViewController: UICollectionViewDelegate{
    
}
