//
//  AppDelegate.swift
//  PokemonToShakespeareanApp
//
//  Created by zip520123 on 11/01/2021.
//  Copyright © 2021 zip520123. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let defaultVC = SearchPokemonViewController()
        defaultVC.view.backgroundColor = .systemBackground
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = defaultVC
        window?.makeKeyAndVisible()
        
        
        return true
    }


}

