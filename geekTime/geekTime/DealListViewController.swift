//
//  DealListViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/27.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit

class DealListViewController: BaseViewController, CommonListDelegate {
    func didSelectItem<Item>(_ item: Item) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let productList = CommonList<Deal, DealListCell>()
        productList.items = FakeData.createDeals()
        view.addSubview(productList)
        productList.delegate = self
        productList.snp.makeConstraints { (make) in
            make.edges.equalToSuperview()
        }
    }
}
