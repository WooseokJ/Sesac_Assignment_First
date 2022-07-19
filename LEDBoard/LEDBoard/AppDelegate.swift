//
//  AppDelegate.swift
//  LEDBoard
//
//  Created by useok on 2022/07/06.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
// 앱딜리게이트는 실행,종료만 씀.

    var window: UIWindow? //12.0이전에는 이게있어야 됨. (Scenedelegate도 있어야하므로 결국 둘다(씬딜리게이트,앱딜리게이트를 둘다 쓴다.)
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(2)
        
        
        return true
    }
    
    // ~ios12까지
    func applicationDidEnterBackground(_ application: UIApplication) {
        // melon,youtube - 사용자 프리미엄 결제시 play, 결제안하면 일시정지
    }
    // ~ios12까지
    func applicationWillEnterForeground(_ application: UIApplication) {
        //   youtube- 결제안한사람에게만 팝업창 띄워!
        //  카톡 잠금화면쓰면 오래안쓰다가 다시쓰면 비밀번호입력화면나옴
        // 금융 백그라운드에있을떄 화면이미지를 막아줌(실행화면 목록중 금융은 임시적으로 화면막아둠 )
    }

    // MARK: UISceneSession Lifecycle
    
    @available(iOS 13.0,*)
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    @available(iOS 13.0,*)
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {

    }


}

