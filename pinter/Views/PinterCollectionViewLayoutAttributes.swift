//
//  PinterCollectionViewLayoutAttributes.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

class PinterCollectionViewLayoutAttributes: UICollectionViewLayoutAttributes {
    var imageHeight: CGFloat = 0.0
    
    
    override func copy(with zone: NSZone? = nil) -> Any {
        let copy = super.copy(with: zone) as! PinterCollectionViewLayoutAttributes
        copy.imageHeight = imageHeight
        return copy

    }
    
    
    override func isEqual(_ object: Any?) -> Bool {
        if let attributes = object as? PinterCollectionViewLayoutAttributes {
            if( attributes.imageHeight == imageHeight  ) {
                return super.isEqual(object)
            }
        }
        return false
    }
}
