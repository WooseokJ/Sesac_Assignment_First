//
//  AppDelegate.swift
//  TrendMedia
//
//  Created by useok on 2022/07/18.
//

import UIKit

@main // 앱이처음실행,종료
class AppDelegate: UIResponder, UIApplicationDelegate {
    //한번만실행
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
   

        
        return true
    }

    @available(iOS 13.0,*)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    @available(iOS 13.0,*) 
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }
}

