//
//  ViewController.swift
//  Mobint
//
//  Created by Daniel Griso Filho on 1/27/16.
//  Copyright © 2016 Daniel Griso Filho. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let api = ConectionAPI()
        api.loadShots(nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

