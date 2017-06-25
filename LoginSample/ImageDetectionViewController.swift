//
//  ImageDetectionViewController.swift
//  LoginSample
//
//  Created by Di Wang on 2017/6/20.
//  Copyright © 2017年 Di Wang. All rights reserved.
//

import UIKit

@available(iOS 11.0, *)
class ImageDetectionViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    let detectionModel = ImageDetectionModel()
    @IBOutlet weak var predictionLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //detectionModel.detectImage(image: image.image!)
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func start(_ sender: UIButton) {
        detectionModel.detectImage(image: image.image!)
        predictionLabel.text = detectionModel.answerText
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
