//
//  SceneDelegate.swift
//  LEDBoard
//
//  Created by useok on 2022/07/06.
//

import UIKit

@available(iOS 13.0,*) //여기다해도 밑에 일일이 다안해도 가능
                        // avielable @:어트리뷰트, *는 13.1,2,3...을 모두 포괄
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    //1
    func sceneDidDisconnect(_ scene: UIScene) {
      
    }
    //2
    func sceneDidBecomeActive(_ scene: UIScene) {

    }
    //3
    func sceneWillResignActive(_ scene: UIScene) {
  
    }
    //4
    func sceneWillEnterForeground(_ scene: UIScene) {

    }
    //5
    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

