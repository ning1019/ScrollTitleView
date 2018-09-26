//
//  ViewController.swift
//  ScrollTitleView
//
//  Created by 宁炜杰 on 2018/9/26.
//  Copyright © 2018年 绿恐龙. All rights reserved.
//

import UIKit

let WIDTH = UIScreen.main.bounds.size.width
let HEIGHT = UIScreen.main.bounds.size.height

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func gotoNextVC(_ sender: UIButton) {
        let nextVC = NextViewController.init()
        self.present(nextVC, animated: true, completion: nil)
    }
    
}

