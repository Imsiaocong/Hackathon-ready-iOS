//
//  ViewController.swift
//  LoginSample
//
//  Created by Di Wang on 2017/5/14.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit
import TextFieldEffects

class ViewController: UIViewController {
    
    private var delegate: AuthDelegate?
    
    @IBOutlet weak var loginCard: CardView!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var username: YokoTextField!
    @IBOutlet weak var password: YokoTextField!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.setup()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setup() {
        self.loginButton.layer.cornerRadius = 2
        let shadowPath = UIBezierPath(roundedRect: loginButton.bounds, cornerRadius: 2)
        self.loginButton.layer.shadowColor = UIColor.black.cgColor
        self.loginButton.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.loginButton.layer.shadowOpacity = 0.5
        self.loginButton.layer.shadowPath = shadowPath.cgPath
        
        UIView.animate(withDuration: 1, delay: 0.3, usingSpringWithDamping: 0.45, initialSpringVelocity: 0.5, options: .allowAnimatedContent, animations: {
            self.loginCard.frame.origin.y = 175
        }, completion: nil)
    }
    
    @IBAction func login(_ sender: UIButton) {
        let un = username.text
        let pw = password.text
        delegate?.auth(un!, password: pw!)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let controller = sb.instantiateViewController(withIdentifier: "NavController")
        self.present(controller, animated: true, completion: nil)
    }
    


}

