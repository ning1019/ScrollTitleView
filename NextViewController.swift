//
//  NextViewController.swift
//  ScrollTitleView
//
//  Created by 宁炜杰 on 2018/9/26.
//  Copyright © 2018年 绿恐龙. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    var scrollView: ScrollTitleView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView = ScrollTitleView.init()
        scrollView?.frame = CGRect(x: 20, y: 300, width: WIDTH - 40, height: 50)
        scrollView?.height = 50
        scrollView?.count = 5
        self.view.addSubview(scrollView!)
    }


    @IBAction func goBackLastVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

}
