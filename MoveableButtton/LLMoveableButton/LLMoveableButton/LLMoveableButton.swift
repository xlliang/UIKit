//
//  LLMoveableButton.swift
//  LLMoveableButton
//
//  Created by 梁先生 on 2017/9/11.
//  Copyright © 2017年 梁先生. All rights reserved.
//

import UIKit

typealias callbackFunc = () -> ()

class LLMoveableButton: UIControl {
    
    var actionBlock:callbackFunc?
    var imageView:UIImageView?
    
    init(frame: CGRect,image: UIImage,ablock:callbackFunc!) {
        super.init(frame:frame)
        addBehavior(image:image,ablock:ablock)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func addBehavior(image:UIImage,ablock:callbackFunc!) {
        actionBlock = ablock
        imageView = UIImageView.init(image: image);
        imageView!.frame = self.bounds;
        imageView!.contentMode = .scaleAspectFit;
        self.clipsToBounds = true;
        imageView!.isUserInteractionEnabled = true;
        self.addSubview(imageView!)
        let tapGesture = UITapGestureRecognizer(target: self, action:#selector(handleTapGesture(sender:)))
        self.addGestureRecognizer(tapGesture);
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let touch = ((touches as NSSet).anyObject() as AnyObject)
        let prePoint = touch.previousLocation(in:self)
        let nowPoint = touch.location(in:self)
        
        let offset = CGPoint(x:nowPoint.x-prePoint.x, y:nowPoint.y-prePoint.y);
        var x = self.center.x+offset.x;
        var y = self.center.y+offset.y;
        let width = UIScreen.main.bounds.size.width;
        let height = UIScreen.main.bounds.size.height;
        
        let viewWidth = self.bounds.size.width/2;
        let viewHeight = self.bounds.size.height/2;
        
        if (x<viewWidth) {
            x=viewWidth;
        }else if(x>width-viewWidth){
            x = width-viewWidth;
        }
        
        if (y<viewHeight) {
            y=viewHeight;
        }else if(y>height-viewHeight){
            y = height-viewHeight;
        }
        
        self.center = CGPoint(x:x, y:y);
    }
    
    @objc func handleTapGesture(sender: AnyObject) {
        print("the result is false")
        if let block = actionBlock{
            block()
        }
    }
    
}
