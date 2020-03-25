//
//  ViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/23.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.green], for: .selected)
//        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.red], for: .normal)
        
        tabBar.tintColor = UIColor.blue
        // 通过UITabBar.appearance() 点不出unselectedItemTintColor属性, 可以直接硬敲
//        UITabBar.appearance().unselectedItemTintColor = UIColor.red
        tabBar.unselectedItemTintColor = UIColor.red
        
        // 初始化子控制器
        let homeVc = HomeViewController()
        let homeNav = UINavigationController(rootViewController: homeVc)
        homeVc.tabBarItem.image = R.image.home()?.withRenderingMode(.alwaysOriginal)
        homeVc.tabBarItem.selectedImage = R.image.home_selected()?.withRenderingMode(.alwaysOriginal)
        homeVc.tabBarItem.title = "首页"
        addChild(homeNav)
        
        let mineVc = MineViewController()
        let mineNav = UINavigationController(rootViewController: mineVc)
        mineVc.tabBarItem.image = R.image.mine()?.withRenderingMode(.alwaysOriginal)
        mineVc.tabBarItem.selectedImage = R.image.mine_selected()?.withRenderingMode(.alwaysOriginal)
        mineVc.tabBarItem.title = "我的"
        addChild(mineNav)
    }
}
