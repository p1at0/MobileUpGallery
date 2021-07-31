//
//  SceneDelegate.swift
//  MobUpGallery
//
//  Created by Абдулла Залимханов on 25.07.2021.
//

import UIKit
import VK_ios_sdk

class SceneDelegate: UIResponder, UIWindowSceneDelegate, AuthServiceDelegate {
    
    var window: UIWindow?
    var authService: AuthService!
    
    static func shared() -> SceneDelegate {
        let scene = UIApplication.shared.connectedScenes.first
        let sd: SceneDelegate =  (((scene?.delegate as? SceneDelegate)!))
        return sd
    }
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        authService = AuthService()
        authService.delegate = self
        let authVC = UIStoryboard(name: "AuthViewController", bundle: nil).instantiateInitialViewController() as? AuthViewController
        window?.rootViewController = authVC
        window?.makeKeyAndVisible()
    }
    
    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        if let url = URLContexts.first?.url {
            VKSdk.processOpen(url, fromApplication: UIApplication.OpenURLOptionsKey.sourceApplication.rawValue)
        }
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
    
    // MARK: AuthServiceDelegate
    
    func authServiceShouldShow(viewController: UIViewController) {
        
        print(#function)
        window?.rootViewController?.present(viewController, animated: true, completion: nil)
    }
    
    func authServiceSighIn() {
        print(#function)
        
        let upCV = UIStoryboard(name: "UpCollectionViewController", bundle: nil).instantiateInitialViewController() as! UpCollectionViewController
        let navVC = UINavigationController(rootViewController: upCV)
        window?.rootViewController = navVC
        
        
        let success = UIAlertController(title: "Успешно!", message: "Вы авторизированы", preferredStyle: .alert)
        success.addAction(UIAlertAction(title: "Продолжить", style: .cancel, handler: { actoin in
            print("tapped")
            
        }))
        
        window?.rootViewController?.present(success, animated: true)
    }
    
    func authServiceSignInDidFail() {
        
        print(#function)
        let alert = UIAlertController(title: "Ошибка", message: "Проверьте соединение с Интернетом", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Назад", style: .cancel, handler: { actoin in
            print("tapped Dismiss")
            
        }))
        
        window?.rootViewController?.present(alert, animated: true)
    }
    
    
}
