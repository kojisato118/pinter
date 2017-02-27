//
//  UICollectionViewCellExtension.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

extension UICollectionViewCell{
    var collectionView: UICollectionView? {
        return value(forKey: "_collectionView") as? UICollectionView
    }
}
