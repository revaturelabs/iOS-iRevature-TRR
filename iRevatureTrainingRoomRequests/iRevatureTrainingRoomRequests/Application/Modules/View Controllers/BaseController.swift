//
//  BaseController.swift
//  iRevatureTrainingRoomRequests
//
//  Created by Nathan Coggins on 2/14/20.
//  Copyright © 2020 revature. All rights reserved.
//

import Foundation
import UIKit

//Base class where the other view controllers  inherit from
class BaseController: UIViewController {
    
    //overriding the viewdidload method
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    //overriding the didReceiveMemoryWarning method
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //checks the Token status
    func checkTokenStatus(){
        //TODO
    }

}
