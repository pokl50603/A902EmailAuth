//
//  Tools.swift
//  A902EmailAuth
//
//  Created by shengyuan on 2022/10/29.
//

import Foundation
import UIKit

extension UIViewController{
    func showMSG(_ msg:String){
        let alert = UIAlertController(title: "提示", message: msg, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "我知道了", style: .default))
        self.present(alert, animated: true)
    }
    
    
    
}
