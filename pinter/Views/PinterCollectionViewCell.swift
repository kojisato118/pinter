//
//  PinterCollectionViewCell.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit
import AVFoundation

class PinterCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageHeightConst: NSLayoutConstraint!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleTopConst: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.titleLabel.font = PinterCollectionViewCell.titleFont
        self.titleTopConst.constant = PinterCollectionViewCell.titleTop
    }
    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        if let attributes = layoutAttributes as? PinterCollectionViewLayoutAttributes {
            self.imageHeightConst.constant = attributes.imageHeight
        }
    }
    
    
    func set(article : Article){
        self.imageView.image = article.image
        self.titleLabel.text = article.title
    }
    
    class func imageHeightWith(image : UIImage, width : CGFloat) -> CGFloat {
        let boundingRect =  CGRect(x: 0, y: 0, width: width, height: CGFloat(MAXFLOAT))
        let rect  = AVMakeRect(aspectRatio: image.size, insideRect: boundingRect)
        return rect.size.height
    }
    
    class func titleHeightWith(title : String, width : CGFloat) -> CGFloat {
        let padding : CGFloat = PinterCollectionViewCell.titleTop
        let width : CGFloat = (width - padding * 2)
        let font = self.titleFont
        
        let rect = NSString(string: title).boundingRect(with: CGSize(width: width, height: CGFloat(MAXFLOAT)), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil)
        return ceil(rect.height) + padding * 2
    }
    
    class var titleFont : UIFont{
        get{
            return UIFont.systemFont(ofSize: 14)
        }
    }
    
    class var titleTop : CGFloat{
        get{
            return 8.0
        }
    }
}
