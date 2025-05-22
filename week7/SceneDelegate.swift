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
            ap.configureWithOpaqueBackground()
            ap.backgroundColor = .navigation
            return ap
        }()
        
        // navigationController 객체
        let navigationController = {
            let navi = UINavigationController(rootViewController: MainTableViewController())
            navi.navigationBar.standardAppearance = appearence
            navi.navigationBar.scrollEdgeAppearance = appearence
            return navi
        }()
         
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}

