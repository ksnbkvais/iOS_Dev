//
//  SceneDelegate.swift
//  movieCollection
//
//  Created by Aisulu Kasenbekova on 14.11.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        
        // Set up the TabBarController
        let tabBarController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TabBarController") as! UITabBarController
        
        // Set the category for each view controller based on their Storyboard ID
//        if let filmsVC = tabBarController.viewControllers?[0] as? ViewController {
//            filmsVC.category = .films
//        }
//
//        if let booksVC = tabBarController.viewControllers?[1] as? ViewController {
//            booksVC.category = .books
//        }
//
//        if let musicVC = tabBarController.viewControllers?[2] as? ViewController {
//            musicVC.category = .music
//        }
        if let filmsVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "FilmsViewController") as? ViewController {
            filmsVC.category = .films
            tabBarController.viewControllers?[2] = UINavigationController(rootViewController: filmsVC)
        }
        
        if let booksVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "BooksViewController") as? ViewController {
            booksVC.category = .books
            tabBarController.viewControllers?[1] = UINavigationController(rootViewController: booksVC)
        }
        
        if let musicVC = tabBarController.storyboard?.instantiateViewController(withIdentifier: "MusicViewController") as? ViewController {
            musicVC.category = .music
            tabBarController.viewControllers?[0] = UINavigationController(rootViewController: musicVC)
        }
        
        window.rootViewController = tabBarController
        self.window = window
        window.makeKeyAndVisible()
    }


//    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
//        let tabBarController = window?.rootViewController as? UITabBarController
//        let viewControllers = tabBarController?.viewControllers
//
//        (viewControllers?[0] as? ViewController)?.category = .films
//        (viewControllers?[1] as? ViewController)?.category = .books
//        (viewControllers?[2] as? ViewController)?.category = .music
//        // Use this method to optionally configure and attach the UIWindow `window` to the provided UIWindowScene `scene`.
//        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
//        // This delegate does not imply the connecting scene or session are new (see `application:configurationForConnectingSceneSession` instead).
//        guard let _ = (scene as? UIWindowScene) else { return }
//    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

