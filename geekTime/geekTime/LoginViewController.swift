//
//  LoginViewController.swift
//  geekTime
//
//  Created by Liubi_Chaos_G on 2020/3/23.
//  Copyright © 2020 Liubi_Chaos_G. All rights reserved.
//

import UIKit
import SnapKit

protocol ValidatePhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool
}

protocol ValidatePassword {
    func validatePassword(_ password: String) -> Bool
}

extension ValidatePhoneNumber {
    func validatePhoneNumber(_ phoneNumber: String) -> Bool {
        if phoneNumber.count != 11 {
            return false
        }
        return true
    }
}

extension ValidatePassword {
    func validatePassword(_ password: String) -> Bool {
        if password.count < 6 || password.count > 12 {
            return false
        }
        return true
    }
}

class LoginViewController: BaseViewController, ValidatePhoneNumber, ValidatePassword {
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
        
        let pwdIcon = UIImageView(image: R.image.icon_pwd())
        pwdTF.leftView = pwdIcon
        pwdTF.leftViewMode = .always
        pwdTF.layer.borderColor = UIColor.hexColor(0x333333).cgColor
        pwdTF.layer.borderWidth = 1.0
        pwdTF.layer.cornerRadius = 5
        pwdTF.layer.masksToBounds = true
        pwdTF.textColor = UIColor.hexColor(0x333333)
        pwdTF.placeholder = "请输入密码"
        pwdTF.isSecureTextEntry = true
        view.addSubview(pwdTF)
        pwdTF.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(phoneTF.snp.bottom).offset(15)
            make.height.equalTo(50)
        }
        
        let loginBtn = UIButton(type: .custom)
        loginBtn.setTitle("登 录", for: .normal)
        loginBtn.setTitleColor(.white, for: .normal)
        loginBtn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
//        loginBtn.backgroundColor = UIColor.hexColor(0xf8892e) // 设置了背景颜色之后,按钮没有高亮
        loginBtn.setBackgroundImage(UIColor.hexColor(0xf8892e).toImage(), for: .normal) // 设置背景图片之后, 按钮存在高亮
        loginBtn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        loginBtn.layer.cornerRadius = 5.0
        loginBtn.layer.masksToBounds = true
        view.addSubview(loginBtn)
        
        loginBtn.snp.makeConstraints { (make) in
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().offset(-20)
            make.top.equalTo(pwdTF.snp.bottom).offset(20)
            make.height.equalTo(50)
        }
    }
    
    @objc private func loginBtnClick() {
        if validatePhoneNumber(phoneTF.text ?? "") && validatePassword(pwdTF.text ?? "") {
            print("验证通过,请求登录...")
        } else {
            showToast()
        }
    }
    func showToast() {
        let alert = UIAlertController(title: "提示", message: "用户名或者密码错误", preferredStyle: .alert)
        present(alert, animated: true, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            alert.dismiss(animated: true, completion: nil)
        }
    }
}
