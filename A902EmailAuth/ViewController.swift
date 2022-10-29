//
//  ViewController.swift
//  A902EmailAuth
//
//  Created by shengyuan on 2022/10/29.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet weak var account: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var statusLebel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { auth, user in
            if let user = user{
                self.statusLebel.text = "歡迎：EC:\(user.isEmailVerified) " + (user.email ?? "未知")
                print(user.email)

            }else{
                print("未登入")
                self.statusLebel.text = "未登入"
            }
        }
    }
    
    @IBAction func goCreateAccount(_ sender: Any) {
        let nextVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "createAccount") as! CreateAccountViewController
        self.present(nextVC, animated: true)
    }
    
    @IBAction func singIn(_ sender: Any) {
        let theAccount = account.text ?? ""
        let thePassword = password.text ?? ""
        
        
        Auth.auth().signIn(withEmail: theAccount, password: thePassword){ authResult, error in
            if let error = error{
                self.showMSG(error.localizedDescription)
                return
            }
        }
        
    }
    
    
    @IBAction func singOut(_ sender: Any) {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error.localizedDescription)
        }
    }
    
    @IBAction func checkEmail(_ sender: Any) {
        if let user = Auth.auth().currentUser{
            user.sendEmailVerification()
            showMSG("請查看你的的 Email")
        }else{
            showMSG("請登入")
        }
    }
}

