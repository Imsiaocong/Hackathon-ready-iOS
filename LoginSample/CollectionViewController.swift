//
//  CollectionCollectionViewController.swift
//  LoginSample
//
//  Created by Di Wang on 2017/5/14.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CollectionViewController: UICollectionViewController, UIGestureRecognizerDelegate {
    
    var addView: CardView!
    var tagNum: Int = 1
    //var gesture: UITapGestureRecognizer!
    var n = 0
    var color = UIColor()
//    var selectedIndex: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.added)), animated: true)
//        self.gesture = UITapGestureRecognizer(target: self, action: #selector(handleGesture(gestureRecognizer:)))
//        self.gesture.delegate = self
//        self.view.addGestureRecognizer(gesture)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 5
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
    
        // Configure the cell
        //cell.setup()
        cell.setNeedsDisplay()
        color = cell.backgroundColor!
        return cell
    }
    
    @objc func added() {
        let swi = UISwitch(frame: CGRect(x: 70, y: 100, width: 30, height: 10))
        
        if ((n % 2) == 0){
        self.addView = CardView(frame: CGRect(x: 230, y: 64, width: 140, height: 200))
        self.addView.backgroundColor = color
        self.addView.tag = tagNum
        self.addView.setNeedsDisplay()
        self.addView.addSubview(swi)
        self.view.addSubview(addView)
            n += 1
        }else if((n % 2) == 1){
            if let viewWithTag = self.view.viewWithTag(tagNum) {
                viewWithTag.removeFromSuperview()
                n += 1
            }else{
                
            }
        }
    }
    
//    @objc func handleGesture(gestureRecognizer: UIGestureRecognizer){
//        //self.addView.removeFromSuperview()
//        if let viewWithTag = self.view.viewWithTag(tagNum) {
//            viewWithTag.removeFromSuperview()
//            n = 0
//        }else{
//            print("No!")
//        }
//    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let cell = collectionView.cellForItem(at: indexPath) as! CardCollectionViewCell
//        self.selectedIndex = indexPath.row
//        collectionView.performBatchUpdates(nil, completion: nil)
//        cell.flippingAnimation()
        print(indexPath.row)
                if let viewWithTag = self.view.viewWithTag(tagNum) {
                    viewWithTag.removeFromSuperview()
                    n = 0
                }else{
                    
                }

    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        //print("didDeselectItemAt: \(indexPath)")
        
        // When selecting a new item, didDeselectItemAt is called before didSelectItemAt,
        // so it is necessary to remove the selected index (i.e. this item's row index)
        // in order for sizeForItemAt to return the deselected size for this item.
        
//        if self.selectedIndex == indexPath.row {
//            self.selectedIndex = NSNotFound
//        }
        
//        collectionView.performBatchUpdates(nil, completion: nil)
    }
    
//    func layoutCells() {
//        let layout = UICollectionViewFlowLayout()
//        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 10, right: 10)
//        layout.minimumInteritemSpacing = 5.0
//        layout.minimumLineSpacing = 5.0
//        layout.itemSize = CGSize(width: (UIScreen.main.bounds.size.width - 40)/3, height: ((UIScreen.main.bounds.size.width - 40)/3))
//        collectionView!.collectionViewLayout = layout
//    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}

//class CollectionViewCell: UICollectionViewCell {
//    var cornerRadius: CGFloat = 2
//    var shadowOffsetWidth: Int = 0
//    var shadowOffsetHeight: Int = 3
//    var shadowColor: UIColor? = UIColor.black
//    var shadowOpacity: Float = 1
//    
//    func setup(){
//        layer.cornerRadius = cornerRadius
//        let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
//        
//        layer.masksToBounds = false
//        layer.shadowColor = shadowColor?.cgColor
//        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight)
//        layer.shadowOpacity = shadowOpacity
//        layer.shadowPath = shadowPath.cgPath
//    }
//}
extension CollectionViewController: UICollectionViewDelegateFlowLayout{
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat{
//        return 100
//    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return inset
    }
}
