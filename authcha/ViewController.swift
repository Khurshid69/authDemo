//
//  ViewController.swift
//  authcha
//
//  Created by user on 18/11/21.
//

import UIKit
import FirebaseEmailAuthUI
import FirebaseAuthUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tapLogin(_ sender: Any) {
        
        let authUI = FUIAuth.defaultAuthUI()
        
        guard authUI != nil else {
            return
        }
        
        authUI?.delegate = self
        authUI?.providers = [FUIEmailAuth()]
        
        
        let authViewController = authUI?.authViewController()
        
        present(authViewController!, animated: true, completion: nil)
        
    }
    
}

extension ViewController: FUIAuthDelegate {
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            return
        }
        
        performSegue(withIdentifier: "goHome", sender: self)
    }
}
