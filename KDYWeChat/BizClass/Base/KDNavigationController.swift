//
//  KDNavigationController.swift
//  KDYWeChat
//
//  Created by kaideyi on 16/9/11.
//  Copyright © 2016年 kaideyi.com. All rights reserved.
//

import UIKit
import UIColor_Hex_Swift

/// 自定义导航栏
class KDNavigationController: UINavigationController, UINavigationControllerDelegate, UIGestureRecognizerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.interactivePopGestureRecognizer?.delegate = self
        self.automaticallyAdjustsScrollViewInsets = false
        
        self.setupNavigationBar()
    }

    override func pushViewController(viewController: UIViewController, animated: Bool) {
        // 添加返回手势
        self.interactivePopGestureRecognizer?.enabled = true
        
        if self.viewControllers.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            
            // 自定义返回按钮
            let button = UIButton()
            button.setBackgroundImage(UIImage(named: "main_back"), forState: .Normal)
            button.addTarget(self, action: #selector(self.backItemAction), forControlEvents: .TouchUpInside)
            button.frame.size = (button.currentBackgroundImage?.size)!
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: button)
        }
        
        super.pushViewController(viewController, animated: animated)
    }

    func setupNavigationBar() {
        UIApplication.sharedApplication().setStatusBarStyle(UIStatusBarStyle.LightContent, animated: true)
        UINavigationBar.appearance().barTintColor = UIColor(colorHex: .barTintColor)
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().translucent = true
        let attributes = [
            NSFontAttributeName: UIFont.systemFontOfSize(19),
            NSForegroundColorAttributeName: UIColor.whiteColor()
        ]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        UIBarButtonItem.appearance().setTitleTextAttributes(
                [NSFontAttributeName: UIFont.systemFontOfSize(16),
                NSForegroundColorAttributeName: UIColor.whiteColor()],
                forState: UIControlState.Normal)
    }
    
    func backItemAction() {
        self.popViewControllerAnimated(true)
    }
}

