

import UIKit
@available(iOS 13.0,*)
// 앱실행도중
class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        UserDefaults.standard.bool(forKey: "First")
        //true이면 VieController, false이면 TrendMediaTableViewController
        
        
        /* 주석 임시로 
        if UserDefaults.standard.bool(forKey: "First"){
            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "trend", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "TrendViewController") as! TrendViewController
            window?.rootViewController = vc2
        }
        else{
            guard let scene = (scene as? UIWindowScene) else { return }
            // 코드로 시작화면구성
            window = UIWindow(windowScene: scene)
            let sb = UIStoryboard(name: "TrendMedia", bundle: nil)
            let vc2 = sb.instantiateViewController(withIdentifier: "TrendMediaTableViewController") as! TrendMediaTableViewController
            window?.rootViewController = UINavigationController(rootViewController: vc2) //네비게이션 없이는 vc2만 입력
            
        }
        window?.makeKeyAndVisible()
        */
        
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)
        let sb = UIStoryboard(name: "Shopping", bundle: nil)
        let vc2 = sb.instantiateViewController(withIdentifier: "CodeShoppingViewController") as! CodeShoppingViewController
        let nav = UINavigationController(rootViewController: vc2)
        window?.rootViewController = nav
        

    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }

    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }

    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }


}

