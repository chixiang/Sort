//
//  AppDelegate.swift
//  Sort
//
//  Created by 池翔 on 2017/5/20.
//  Copyright © 2017年 池翔. All rights reserved.
//

//import UIKit
//
//@UIApplicationMain
//class AppDelegate: UIResponder, UIApplicationDelegate {
//
//    var window: UIWindow?
//
//
//    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
//        // Override point for customization after application launch.
//        return true
//    }
//
//    func applicationWillResignActive(_ application: UIApplication) {
//        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
//        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
//    }
//
//    func applicationDidEnterBackground(_ application: UIApplication) {
//        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
//        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    }
//
//    func applicationWillEnterForeground(_ application: UIApplication) {
//        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
//    }
//
//    func applicationDidBecomeActive(_ application: UIApplication) {
//        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
//    }
//
//    func applicationWillTerminate(_ application: UIApplication) {
//        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
//    }
//
//
//}

import UIKit
import Eureka

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    //        window = UIWindow(frame: UIScreen.main.bounds)
    //        window?.rootViewController = UINavigationController(rootViewController: TemplateListViewController(style: .plain))
    //        window?.makeKeyAndVisible()
    //        return true
    //    }
    
    //    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey : Any]? = nil) -> Bool {
    //        // Take a look at Main.storyboard
    //        return true
    //    }
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        let template1 = Template(templateName: "测试模版一",
                                templateFields: [TemplateField(fieldName: "栏位一",
                                                               fieldType: "Text",
                                                               fieldItems: [FieldItem(itemName: "item1")])])
        let template2 = Template(templateName: "测试模版二",
                                templateFields: [TemplateField(fieldName: "栏位二",
                                                               fieldType: "Text",
                                                               fieldItems: [FieldItem(itemName: "item2")])])
        let viewModel = TemplateListViewController.ViewModel(templates: [template1, template2])
        let templateListViewController = TemplateListViewController(viewModel: viewModel)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let navigationController = UINavigationController(rootViewController: templateListViewController)
        window?.backgroundColor = .black
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        UINavigationBar.appearance().barTintColor = UIColor(red: 237.0/255, green: 76/255, blue: 119/255, alpha: 1)
        UINavigationBar.appearance().isTranslucent = false
        let navigationTitleAttributes: [String: Any] = {
            return [ NSForegroundColorAttributeName: UIColor.white ]
        }()
        UINavigationBar.appearance().tintColor = .white
        UIBarButtonItem.appearance().setTitleTextAttributes(navigationTitleAttributes, for: .normal)
        UINavigationBar.appearance().titleTextAttributes = navigationTitleAttributes
        
        return true
    }
}



