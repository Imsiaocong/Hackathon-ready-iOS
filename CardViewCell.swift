//
//  CardViewCell.swift
//  LoginSample
//
//  Created by Di Wang on 2017/5/15.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

@IBDesignable
class CardCollectionViewCell: UICollectionViewCell {
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.black
    @IBInspectable var shadowOpacity: Float = 1
    
    
//    private var frontImage: UIImageView!
//    private var backImage: UIImageView!
//    private var flipped = false
    
    override func layoutSubviews() {
        
        layer.cornerRadius = cornerRadius
        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
//        self.contentView.addSubview(frontImage)
    }
//    
//    func flippingAnimation(){
////        if (flipped){
////        UIView.transition(with: self.contentView, duration: 0.75, options: .transitionFlipFromLeft, animations: {
////            self.backImage.removeFromSuperview()
////            self.contentView.addSubview(self.frontImage)
////        }) { (Bool) in
////            self.flipped = !self.flipped
////            }
////        }else{
////            UIView.transition(with: self.contentView, duration: 0.75, options: .transitionFlipFromLeft, animations: {
////                self.frontImage.removeFromSuperview()
////                self.contentView.addSubview(self.backImage)
////            }) { (Bool) in
////                self.flipped = !self.flipped
////            }
////        }
//        if (backImage.superview != nil){
//            UIView.transition(with: self.contentView, duration: 0.75, options: .transitionFlipFromLeft, animations: { 
//                self.backImage.removeFromSuperview()
//                self.contentView.addSubview(self.frontImage)
//            }, completion: nil)
//        }else{
//            UIView.transition(with: self.contentView, duration: 0.75, options: .transitionFlipFromLeft, animations: {
//                self.frontImage.removeFromSuperview()
//                self.contentView.addSubview(self.backImage)
//            }, completion: nil)
//        }
//    }
//    
    override func apply(_ layoutAttributes: UICollectionViewLayoutAttributes) {
        super.apply(layoutAttributes)
        layoutIfNeeded()
    }
    
    
    
    //    @objc private func flipAnim(gestureRecognizer: UIGestureRecognizer){
    //        UIView.transition(from: CardCollectionViewCell(), to: CardCollectionViewCell(), duration: 1, options: .transitionFlipFromLeft, completion: nil)
    //    }
}
