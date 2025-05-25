//
//  SceneDelegate.swift
//  week7
//
//  Created by 홍기정 on 5/21/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
            
        // navigationController 의 appearence 객체
        let appearence = {
            let ap = UINavigationBarAppearance()
            ap.configureWithOpaqueBackground() // 불투명한 배경
            ap.backgroundColor = .navigation // 색상 적용
            ap.titleTextAttributes = [.foregroundColor: UIColor.white] // navigation bar 중심에 보이는 title의 색깔
            //ap.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            return ap
        }()
        
        let rootVC = {
            let rootVC = MyTableViewController()
            rootVC.title = "설정"
            return rootVC
        }()
        
        // navigationController 객체
        let navigationController = {
            let navi = UINavigationController(rootViewController: rootVC)
            
            navi.navigationBar.standardAppearance = appearence
            navi.navigationBar.scrollEdgeAppearance = appearence
            
            // navigation bar 좌측에 보이는 arrow + 이전 vc의 title 색깔
            navi.navigationBar.tintColor = .white
            
            return navi
        }()
         
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
    }
}

