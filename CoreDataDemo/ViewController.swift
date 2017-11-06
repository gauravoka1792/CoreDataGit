//
//  ViewController.swift
//  CoreDataDemo
//
//  Created by Gaurav Oka on 11/1/17.
//  Copyright © 2017 Gaurav Oka. All rights reserved.
//

import UIKit
import SnapKit
import Lottie


class ViewController: UIViewController {
    
    var segcontrol = UISegmentedControl()
    var animationView: LOTAnimationView = LOTAnimationView(name: "gears");
    
    var childviewcon1 = FbLoginViewController()
    var childviewcon2 = tblViewController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        childviewcon1.delegate = coreViewController()
        view.backgroundColor = UIColor .white
        segcontrol.removeAllSegments()
        segcontrol.insertSegment(withTitle: "Title", at: 0, animated: true)
        segcontrol.setTitle("Facebook", forSegmentAt: 0)
        segcontrol.insertSegment(withTitle: "Title", at: 1, animated: true)
        segcontrol.setTitle("Information", forSegmentAt: 1)
        segcontrol.addTarget(self, action: #selector(selectionDidChange), for: .valueChanged)
        segcontrol.selectedSegmentIndex = 0
        segcontrol.sendActions(for: .valueChanged)
        segcontrol.tintColor = UIColor .black
        self.view.addSubview(segcontrol)
        
        segcontrol.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(100)
            make.centerX.equalTo(view)
            
        }
        
    }
    
    @objc func selectionDidChange()
    {
        switch self.segcontrol.selectedSegmentIndex{
        case 0:
            childviewcon2.willMove(toParentViewController: nil)
            childviewcon2.view.removeFromSuperview()
            childviewcon2.removeFromParentViewController()
            childviewcon2.didMove(toParentViewController: nil)
            

            childviewcon1.willMove(toParentViewController: self)
            self.addChildViewController(childviewcon1)
            view.addSubview(childviewcon1.view)
            childviewcon1.didMove(toParentViewController: self)
            childviewcon1.view.snp.makeConstraints({ (make) in
                make.top.equalTo(view).offset(300)
                make.left.right.bottom.equalTo(view).offset(0)
            })
            
        case 1:
            childviewcon1.willMove(toParentViewController: nil)
            childviewcon1.view.removeFromSuperview()
            childviewcon1.removeFromParentViewController()
            childviewcon1.didMove(toParentViewController: nil)
            
            

            childviewcon2.willMove(toParentViewController: self)
            self.addChildViewController(childviewcon2)
            view.addSubview(childviewcon2.view)
            childviewcon2.didMove(toParentViewController: self)
            childviewcon2.view.snp.makeConstraints({ (make) in
                make.top.equalTo(view).offset(300)
                make.left.right.bottom.equalTo(view).offset(0)
            })
        default:
            break;
            
        }
        
        
    }
    
    
    
    
    override func viewWillDisappear(_ animated: Bool) {
        animationView.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.view.addSubview(animationView)
       // animationView.frame = CGRect(x:0,y:100,width:400,height:300)
        animationView.autoReverseAnimation = true
        animationView.loopAnimation = true
        animationView.play()
        
        animationView.snp.makeConstraints { (make) in
            make.top.equalTo(segcontrol.snp.bottom).offset(50)
            make.centerX.equalTo(view)
            make.width.equalTo(100)
            make.width.equalTo(100)
            
        }
    }
}

