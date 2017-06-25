//
//  VCSharedBusiness.swift
//
//  与本系统相关的view controller通用业务方法
//
//  Created by 姬鹏 on 2017/3/20.
//  Copyright © 2017年 tymaker. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    // 检查用户是否处于登录状态，如果处于登录状态，则返回true
    func isLogined() -> Bool {
        var logined = true
        
        let deviceId = self.getStringFromUserDefaultsByKey(key: deviceIdKey)
        
        if deviceId == "" || deviceId == nil {
            logined = false
        }
        
        return logined
    }
    
    // 打开登录界面
    func needsLogin(_ completion: (() -> Void)?) {
        //
    }
    
    // 在已登录的情况下，退出登录
    func needsLogout() {
        let user = User()
        user.userLogoutCompletion = {
            let _ = self.removeStringFromUserDefaultsByKey(key: deviceIdKey)
            let _ = self.removeStringFromUserDefaultsByKey(key: userKey)
            // 将首页设置成Login界面
            let w = (UIApplication.shared.delegate as! AppDelegate).window!
            let sb = UIStoryboard(name: "Login", bundle: nil)
            let vcLogin = sb.instantiateViewController(withIdentifier: "vcLogin") as! VCLogin
            let ncLogin = NCHome(rootViewController: vcLogin)
            
            w.rootViewController = ncLogin
            w.makeKeyAndVisible()
        }
        user.logout(self, viewToBlock: nil)
    }
    
    // 显示没有网络连接的错误提示界面，并设置该界面中重试按钮的回调函数
    func showNoConnectionView(containerView view: UIView, clickEvent event: @escaping ((AnyObject) -> Void)) {
        let nib = UINib(nibName: "NoConnectionView", bundle: nil)
        let ncv = nib.instantiate(withOwner: nib, options: nil)[0] as! VNoConnectionView
        ncv.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.addSubview(ncv)
        
        ncv.tag = NoConnectionViewTag
        ncv.retryFunction = event
    }
    
    // 将没有网络连接的错误提示界面从主界面中移除
    func removeNoConnectView(containerView view: UIView) {
        if let ncv = view.viewWithTag(NoConnectionViewTag) {
            ncv.removeFromSuperview()
        }
    }
    
    // 显示没有数据的提示界面，并设置该界面中按钮的文本和点击该按钮时的回调函数
    func showNoDataView(containerView view: UIView) {
        let nib = UINib(nibName: "NoDataView", bundle: nil)
        let ndv = nib.instantiate(withOwner: nib, options: nil)[0] as! VNoDataView
        ndv.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenHeight)
        view.addSubview(ndv)
        
        ndv.tag = NoDataViewTag
    }
    
    // 将没有数据提示界面从主界面中移除
    func removeNoDataView(containerView view: UIView) {
        if let ndv = view.viewWithTag(NoDataViewTag) {
            ndv.removeFromSuperview()
        }
    }
    
    // 获取时间戳
    func getTimeStamp() -> Int {
        let now = Date()
        let timeStamp = now.timeIntervalSince1970
        return Int(timeStamp)
    }
    
    // 取得随机数
    func getRandomSuffix(length: UInt?) -> UInt32 {
        if let len = length {
            var maxVal:UInt32 = 10
            for _ in 0..<len {
                maxVal *= 10
            }
            return arc4random_uniform(maxVal)
        }
        return arc4random_uniform(1000)
    }
}
























