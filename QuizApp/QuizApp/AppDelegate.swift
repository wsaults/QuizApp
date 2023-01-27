//
//  AppDelegate.swift
//  QuizApp
//
//  Created by Will Saults on 1/13/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        let viewController = QuestionViewController(
            question: "A Question?",
            options: ["Option 1", "Option 2"],
            selection: {
                print($0)
            }
        )

        _ = viewController.view
        viewController.tableView.allowsMultipleSelection = true

        window.rootViewController = viewController
        window.makeKeyAndVisible()
        return true
    }
}

