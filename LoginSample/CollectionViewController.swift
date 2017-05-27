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
    var imageList = ["coffee","selfie","selfie2","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee","coffee"]
    var n = 0
    var rows:Int = 0

    let swi = UISwitch(frame: CGRect(x: 10, y: 10, width: 30, height: 10))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.added)), animated: true)
        
        swi.addTarget(self, action:  #selector(switchChange), for: UIControlEvents.valueChanged)
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
        return rows
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CardCollectionViewCell
        cell.headImage.image = UIImage(named: imageList[indexPath.row])
        cell.setNeedsDisplay()
        return cell
    }
    
    @objc func added() {
        
        if ((n % 2) == 0){
        self.addView = CardView(frame: CGRect(x: 230, y: 64, width: 140, height: 200))
        self.addView.tag = tagNum
        self.addView.setNeedsDisplay()
        self.addView.backgroundColor = UIColor(red: 26, green: 188, blue: 156, alpha: 1)
        self.addView.addSubview(swi)
        self.view.addSubview(addView)
        self.addView.alpha = 0
            UIView.animate(withDuration: 0.35, animations: {
                self.addView.alpha = 1
            }, completion: nil)
            n += 1
        }else if((n % 2) == 1){
            if let viewWithTag = self.view.viewWithTag(tagNum) {
                UIView.animate(withDuration: 0.35, animations: {
                    self.addView.alpha = 0
                }, completion: { (Bool) in
                    viewWithTag.removeFromSuperview()
                })
                n += 1
            }else{
                
            }
        }
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        print(indexPath.row)
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "DetailViewController")
        self.present(controller, animated: true, completion: nil)
        
                if let viewWithTag = self.view.viewWithTag(tagNum) {
                    viewWithTag.removeFromSuperview()
                    n = 0
                }else{
                    
                }

    }
    
    override func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
    }
    
    func switchChange() {
        if swi.isOn {
        print("added")
        rows += 1
        collectionView?.reloadData()
        }
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets{
        let inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return inset
    }
}
