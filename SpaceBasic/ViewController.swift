//
//  ViewController.swift
//  SpaceBasic
//
//  Created by Shubham Singh on 22/02/20.
//  Copyright © 2020 Shubham Singh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
        SBAPI.getPatientData(pageNo: 2) {(res) in
            print("res", res)
        }
    }


}

