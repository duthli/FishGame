//
//  GameManager.swift
//  FishGame
//
//  Created by do duy hung on 24/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//

import UIKit

class GameManager: NSObject {
    var fishViews : NSMutableArray?
    var hookView : Hooker?
    override init()
    {
        self.fishViews = NSMutableArray()
        self.hookView = Hooker(frame: CGRectMake(0, -490, 20, 490))
    }
    func addFishToviewController(viewcontroller:UIViewController,
        width:Int)
    {
        let fishView = FishView(frame: CGRectMake(0, 0, 40, 30))
        fishView.generateFish(width)
        self.fishViews?.addObject(fishView)
        viewcontroller.view.addSubview(fishView)
    }
    func updateMove()
    {
        self.hookView?.updateMove()
        for fishView in self.fishViews!
        {
            fishView.updateMove()
            
            if (CGRectContainsPoint(fishView.frame, CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)))
            {
                bite (fishView as! FishView)
            }
        }
    }
    var batca = 0;

    func dropHookerAtX(x: Int)
    {
        self.hookView?.dropDownAtX(x)
        batca = 0;
    }
        func bite(fishView: FishView)
    {
        
        if (fishView.status != fishView.CAUGHT && self.hookView?.status != self.hookView?.DRAWINGUP && batca == 0)
        {
            fishView.caught()
            fishView.center = CGPointMake(self.hookView!.center.x, self.hookView!.frame.origin.y + self.hookView!.frame.height + fishView.frame.width/2)
            self.hookView?.status = self.hookView?.CAUGHTF
        }
        if(hookView?.status == self.hookView?.CAUGHTF && fishView.status == fishView.CAUGHT){
            batca = 1;
        }
    }
    
}
