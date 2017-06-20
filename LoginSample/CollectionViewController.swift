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
    
    let model = CollectionViewModel()
    var addView: AddFeatureView!
    var tagNum: Int = 1
    var n = 0
    var rows:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.setRightBarButton(UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(self.added)), animated: true)
        model.swi = UISwitch(frame: CGRect(x: 10, y: 20, width: 30, height: 10))
        model.swi.addTarget(self, action:  #selector(reloadData), for: UIControlEvents.valueChanged)
        model.switch_2 = UISwitch(frame: CGRect(x: 10, y: 60, width: 30, height: 10))
        model.switch_2.addTarget(self, action:  #selector(reloadData_2), for: UIControlEvents.valueChanged)
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
        cell.headImage.image = UIImage(named: model.imageList[indexPath.row])
        cell.setNeedsDisplay()
        return cell
    }
    
    @objc func added() {
        
        if ((n % 2) == 0){
        self.addView = AddFeatureView(frame: CGRect(x: 230, y: 670, width: 140, height: 200))
        self.addView.tag = tagNum
        self.addView.setNeedsDisplay()
        self.addView.backgroundColor = UIColor(red: 26, green: 188, blue: 156, alpha: 1)
        self.addView.addSubview(model.swi)
        self.addView.addSubview(model.switch_2)
        self.view.addSubview(addView)
        self.addView.alpha = 0
            UIView.animate(withDuration: 0.35, animations: {
                self.addView.alpha = 1
                self.addView.frame.origin = CGPoint(x: 230, y: 64)
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
    
    func switchChange() {
        if model.swi.isOn || model.switch_2.isOn {
        rows += 1
            print(model.imageList)
        collectionView?.reloadData()
        }else if model.swi.isOn != true || model.switch_2.isOn != true{
            print(model.imageList)
            rows -= 1
            collectionView?.reloadData()
        }
    }
    
    @objc func reloadData(n: Int){
        if model.swi.isOn{
        model.imageList.append("selfie2")
        switchChange()
        }else{
            model.imageList.remove(at: model.imageList.index(of: "selfie2")!)
            switchChange()
        }
    }
    @objc func reloadData_2(){
        if model.switch_2.isOn{
            model.imageList.append("coffee")
            switchChange()
        }else{
            model.imageList.remove(at: model.imageList.index(of: "coffee")!)
            switchChange()
        }
    }

}
