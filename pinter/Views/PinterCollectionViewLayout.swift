//
//  PinterCollectionViewLayout.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

@objc protocol PinterCollectionViewLayoutDelegate {
    func collectionView(_ collectionView:UICollectionView, heightForPhotoAtIndexPath indexPath:IndexPath,
                        withWidth:CGFloat) -> CGFloat

    func collectionView(_ collectionView: UICollectionView,
                        heightForTitleAtIndexPath indexPath: IndexPath, withWidth width: CGFloat) -> CGFloat
}

class PinterCollectionViewLayout: UICollectionViewLayout {
    weak var delegate : PinterCollectionViewLayoutDelegate? = nil
    
    let numberOfColumns = 2
    let cellPadding : CGFloat = 8.0
    
    fileprivate var cache : [PinterCollectionViewLayoutAttributes] = []
    fileprivate var contentHeight: CGFloat  = 0.0
    fileprivate var contentWidth: CGFloat {
        let insets = collectionView!.contentInset
        return collectionView!.bounds.width - (insets.left + insets.right)
    }
    
    override func prepare() {
        if cache.isEmpty {
            let columnWidth = contentWidth / CGFloat(numberOfColumns)
            var xOffset : [CGFloat] = []
            for column in 0 ..< numberOfColumns {
                xOffset.append(CGFloat(column) * columnWidth )
            }
            var column = 0
            var yOffset = [CGFloat](repeating: 0, count: numberOfColumns)
            
            for item in 0 ..< collectionView!.numberOfItems(inSection: 0) {
                
                let indexPath = IndexPath(item: item, section: 0)
                
                let width = columnWidth - cellPadding * 2
                let imageHeight = self.delegate?.collectionView(collectionView!, heightForPhotoAtIndexPath: indexPath,
                                                                      withWidth:width)
                let titleHeight = self.delegate?.collectionView(collectionView!,
                                                                      heightForTitleAtIndexPath: indexPath, withWidth: width)
                
                let height = cellPadding +  imageHeight! + titleHeight! + cellPadding
                let frame = CGRect(x: xOffset[column], y: yOffset[column], width: columnWidth, height: height)
                let insetFrame = frame.insetBy(dx: cellPadding, dy: cellPadding)
                
                let attributes = PinterCollectionViewLayoutAttributes(forCellWith: indexPath)
                attributes.imageHeight = imageHeight!
                attributes.frame = insetFrame
                cache.append(attributes)
                
                contentHeight = max(contentHeight, frame.maxY)
                yOffset[column] = yOffset[column] + height
                
                column = column >= (numberOfColumns - 1) ? 0 : column + 1
            }
        }
    }
    
    override var collectionViewContentSize : CGSize {
        get{
            return CGSize(width: contentWidth, height: contentHeight)
        }
    }

    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        
        var layoutAttributes : [UICollectionViewLayoutAttributes] = []
        
        for attributes in cache {
            if attributes.frame.intersects(rect) {
                layoutAttributes.append(attributes)
            }
        }
        return layoutAttributes
    }
    
    override class var layoutAttributesClass : AnyClass {
        get{
            return PinterCollectionViewLayoutAttributes.self
        }
    }

}
