//
//  Article.swift
//  pinter
//
//  Created by 佐藤 康次 on 2017/02/26.
//  Copyright © 2017年 toosaa. All rights reserved.
//

import UIKit

class Article: NSObject {
    let title : String
    let imageUrl : String
    var image : UIImage? = nil
    
    init(title : String, imageUrl : String) {
        self.title = title
        self.imageUrl = imageUrl
        
        super.init()
    }
}
