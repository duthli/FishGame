//
//  ViewController.swift
//  FishGame
//
//  Created by do duy hung on 24/08/2016.
//  Copyright © 2016 do duy hung. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    var gameManager : GameManager?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.gameManager = GameManager()
        self.view.addSubview((self.gameManager?.hookView)!)
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
        self.view.addGestureRecognizer(UITapGestureRecognizer(target: self, action:"tapHandle:"))
        NSTimer.scheduledTimerWithTimeInterval(0.025, target: self.gameManager!, selector: "updateMove", userInfo: nil, repeats: true)
        
    }
    func tapHandle(sender: UIGestureRecognizer)
    {
        let tapPoint = sender.locationInView(self.view)
        self.gameManager?.dropHookerAtX(Int(tapPoint.x))
    }
    @IBAction func reset(sender: AnyObject)
    {
        self.gameManager?.fishViews?.removeAllObjects()
        for object in self.view.subviews
        {
            if (object .isKindOfClass(FishView))
            {
                object .removeFromSuperview()
            }
        }
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
        
    }
    @IBAction func addFish(sender: AnyObject)
    {
        self.gameManager?.addFishToviewController(self, width: Int(self.view.bounds.width))
    }
}

