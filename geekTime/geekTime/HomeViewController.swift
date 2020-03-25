//
//  HomeViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/24.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit
import Kingfisher

class HomeViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let bannerView = BannerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 176))
        bannerView.autoScrollInterval = 2
        bannerView.isInfinite = true
        bannerView.dataSource = self
        view.addSubview(bannerView)
        
        let productList = ProductList()
        productList.items = FakeData.createProducts()
        view.addSubview(productList)
        productList.snp.makeConstraints { (make) in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(bannerView.snp.bottom).offset(5)
        }
    }
}

extension HomeViewController: BannerViewDataSource {
    func numberOfBanners(_ bannerView: BannerView) -> Int {
        return FakeData.createBanners().count
    }
    func viewForBanner(_ bannerView: BannerView, index: Int, convertView: UIView?) -> UIView {
        if let view = convertView as? UIImageView {
            view.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return view
        } else {
            let imageView = UIImageView()
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.kf.setImage(with: URL(string: FakeData.createBanners()[index]))
            return imageView
        }
    }
}
