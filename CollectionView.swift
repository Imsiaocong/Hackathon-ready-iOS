//
//  CollectionView.swift
//  LoginSample
//
//  Created by Di Wang on 2017/6/18.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

extension CollectionViewController: UICollectionViewDelegateFlowLayout{
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
            let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            return inset
        }
    
    
}
