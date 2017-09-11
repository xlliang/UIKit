//
//  ViewController.swift
//  LLMoveableButton
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bt = LLMoveableButton.init(frame: CGRect(x:0,y:200,width:80,height:80), image:UIImage.init(imageLiteralResourceName:"test")) {
            print("the result is test")
        }
        self.view.addSubview(bt)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

