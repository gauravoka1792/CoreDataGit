//
//  tblViewController.swift
//  CoreDataDemo
//
//  Created by Gaurav Oka on 11/1/17.
//  Copyright © 2017 Gaurav Oka. All rights reserved.
//

import UIKit


class tblViewController: UIViewController {
    
    
  
    
    var btnnext = UIButton()
     
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
         view.backgroundColor = UIColor(red:163.0/255.0,green:232.0/255.0,blue:255.0/255.0,alpha:1.0)
        
       btnnext.setTitle("Next", for: .normal)
       btnnext.setTitleColor(UIColor .black, for: .normal)
       btnnext.layer.borderWidth = 1
        btnnext.addTarget(self, action: #selector(nextgo), for: .touchUpInside)
       view.addSubview(btnnext)
        btnnext.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(90)
        }
        
     
    }
    
    @objc func nextgo (){
    
            let viewcon = coreViewController()
            self.parent?.navigationController?.pushViewController(viewcon, animated: true)
        
        

        }
        
        
}
    

   


