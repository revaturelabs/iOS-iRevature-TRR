//
//  ViewController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/11/20.
//  Copyright © 2020 revature. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButton(_ sender: Any) {
        
    }
    
}

