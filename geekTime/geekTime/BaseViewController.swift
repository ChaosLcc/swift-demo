//
//  BaseViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/23.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.hexColor(0xf2f2f2)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.hexColor(0x333333)]
        // 指定边缘要延伸的方向, 默认值是 UIRectEdge.all, 即向四周边缘均延伸 布局从屏幕顶部开始
        // rawValue: 0 即不延伸 布局从navigationBar底部开始
        // 修改后的注意事项: 导航栏默认是半透明的, 我们还需要修改 UIWindow 的背景色(默认是黑色), 将其改为白色, 如下
        // window?.backgroundColor = UIColor.white
        edgesForExtendedLayout = UIRectEdge(rawValue: 0)
    }
}
