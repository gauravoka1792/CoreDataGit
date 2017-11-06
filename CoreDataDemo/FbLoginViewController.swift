//
//  FbLoginViewController.swift
//  CoreDataDemo
//
//  Created by Gaurav Oka on 11/1/17.
//  Copyright © 2017 Gaurav Oka. All rights reserved.
//

import UIKit
import SnapKit
import FBSDKLoginKit

protocol classfbDelegate: class {
    func passData(info: [String : AnyObject])
}

class FbLoginViewController: UIViewController {
    var dict : [String : AnyObject] = [:]
    
    var btnlogin = UIButton()
    
    var delegate: classfbDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red:52.0/255.0,green:156.0/255.0,blue:250.0/255.0,alpha:1.0)
        
        let image = UIImage(named:"facebook")
        btnlogin.setImage(image, for: .normal)
        btnlogin.layer.borderWidth = 1
        self.view.addSubview(btnlogin)
        btnlogin.addTarget(self, action: #selector(fbLogin), for: .touchUpInside)
        btnlogin.snp.makeConstraints { (make) in
            make.centerX.equalTo(view)
            make.centerY.equalTo(view)
            make.width.equalTo(200)
            make.height.equalTo(90)
        }
    }
    
    
    @objc func fbLogin(_ sender: AnyObject)
    {
        let fbLoginManager : FBSDKLoginManager = FBSDKLoginManager()
        fbLoginManager.logIn(withReadPermissions: ["email"], from: self) { (result, error) in
            if (error == nil){
                let fbloginresult : FBSDKLoginManagerLoginResult = result!
                if fbloginresult.grantedPermissions != nil {
                    if(fbloginresult.grantedPermissions.contains("email"))
                    {
                        self.getFBUserData()
                        
                        fbLoginManager.logOut()
                    }
                }
            }
        }
    }
    
    func getFBUserData(){
        if((FBSDKAccessToken.current()) != nil){
            FBSDKGraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completionHandler: { (connection, result, error) -> Void in
                if (error == nil){
                    
                    self.dict = result as! [String : AnyObject]
                    self.delegate?.passData(info: self.dict)
                    
                    
                    print(result!)
                    print(self.dict)
                }
            })
        }
    }


}
