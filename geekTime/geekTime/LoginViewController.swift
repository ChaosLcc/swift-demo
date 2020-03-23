//
//  LoginViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/23.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit
import SnapKit

class LoginViewController: BaseViewController {
    var phoneTF = UITextField()
    var pwdTF = UITextField()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let logoView = UIImageView(image: R.image.logo())
        view.addSubview(logoView)
        logoView.snp.makeConstraints { (make) in
            make.top.equalToSuperview().offset(30)
            make.centerX.equalToSuperview()
        }
        
        let phoneIcon = UIImageView(image: R.image.icon_phone())
        phoneTF.leftView = phoneIcon
        phoneTF.leftViewMode = .always
        phoneTF.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        phoneTF.layer.borderWidth = 1.0
        phoneTF.layer.cornerRadius = 5
        phoneTF.layer.masksToBounds = true
        phoneTF.textColor = UIColor.hexColor(0x333333)
        phoneTF.placeholder = "请输入手机号"
        view.addSubview(phoneTF)
        phoneTF.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(logoView.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
}
