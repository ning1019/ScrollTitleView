//
//  ScrollTitleView.swift
//  ScrollTitleView
//
//  Created by 宁炜杰 on 2018/9/26.
//  Copyright © 2018年 绿恐龙. All rights reserved.
//

import UIKit

class ScrollTitleView: UIView {

    var timer: Timer?
    var mainScrollView: UIScrollView?
    var currentIndex: Int?
    var height: CGFloat?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.lightGray
        currentIndex = 0
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        mainScrollView = UIScrollView.init()
        mainScrollView?.isPagingEnabled = true
        mainScrollView?.frame = CGRect(x: 0, y: 0, width: self.frame.width, height: height!)
        mainScrollView?.contentSize = CGSize(width: self.frame.width, height: height! * CGFloat(count!))
        self.addSubview(mainScrollView!)
        
        for i in 0..<count! {
            let titleLabel = UILabel.init()
            if i == (count! - 1) {
                titleLabel.text = "这是第0个"
            } else {
                titleLabel.text = "这是第\(i)个"
            }
            titleLabel.font = UIFont.init(name: "PingFangSC-Medium", size: 20)
            titleLabel.textColor = UIColor.darkGray
            titleLabel.frame = CGRect(x: 0, y: height! * CGFloat(i), width: WIDTH - 40, height: height!)
            mainScrollView?.addSubview(titleLabel)
        }
        
        //  进入页面延迟一秒执行动画
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
            self.setupFrames()
        }
    }
    
    func setupFrames() {
        //  防止内存泄漏，用弱引用
        weak var weakSelf = self
        if timer == nil {
            if #available(iOS 10.0, *) {
                timer = Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { (timer) in
                    weakSelf?.timerFunctions()
                }
            } else {
                // Fallback on earlier versions
                timer = Timer.scheduledTimer(timeInterval: 2, target: weakSelf!, selector: #selector(timerFunctions), userInfo: nil, repeats: true)
            }
            timer?.fire()
        }
    }
    
    //  滑动到最后一个切换为第一个
    @objc func timerFunctions() {
        if self.currentIndex == (self.count! - 1) {
            self.currentIndex = 1
            self.mainScrollView?.contentOffset.y = 0
        } else {
            self.currentIndex = self.currentIndex! + 1
        }
        UIView.animate(withDuration: 1, animations: {
            self.mainScrollView?.contentOffset.y = self.height! * CGFloat(self.currentIndex!)
        })
    }
    
    var count: Int? {
        didSet {
            setupUI()
        }
    }
    
    //  离开页面销毁定时器
    deinit {
        print("结束！！！")
        timer?.invalidate()
        timer = nil
    }

}
