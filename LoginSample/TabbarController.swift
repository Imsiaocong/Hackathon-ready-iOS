//
//  TabbarController.swift
//  LoginSample
//
//  Created by Di Wang on 2017/7/10.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

class TabbarController: UITabBarController, UIGestureRecognizerDelegate {
    
    var swipe: UISwipeGestureRecognizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        swipe = UISwipeGestureRecognizer(target: self, action: #selector(TabbarController.toDismiss))
        swipe.delegate = self
        swipe.direction = .down
        
        self.view.addGestureRecognizer(swipe)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func toDismiss() {
        print("Dismissed")
        dismiss(animated: true, completion: nil)
    }
}
