//
//  AddFeatureView.swift
//  LoginSample
//
//  Created by Di Wang on 2017/6/4.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class AddFeatureView: CardView {
    
    @IBOutlet var view: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        UINib.init(nibName: "AddFeatureView", bundle: nil).instantiate(withOwner: self, options: nil)
        addSubview(view)
        view.frame = self.bounds
    }

}
