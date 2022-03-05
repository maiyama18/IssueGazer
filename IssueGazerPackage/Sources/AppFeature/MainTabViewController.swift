//
//  MainTabViewContorller.swift
//  AppFeature
//
//  Created by maiyama on 2022/03/05.
//

import UIKit
import Resources
import QueriesFeature
import SettingsFeature

public final class MainTabViewController: UITabBarController {
    enum Tab: Int {
        case queries
        case settings
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let queries = UINavigationController(rootViewController: QueriesViewController())
        queries.tabBarItem = UITabBarItem(
            title: L10n.Queries.title, image: UIImage(systemName: "number"), tag: Tab.queries.rawValue)
        
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(
            title: L10n.Settings.title, image: UIImage(systemName: "gearshape"), tag: Tab.settings.rawValue)

        viewControllers = [queries, settings]
        selectedIndex = Tab.queries.rawValue
    }
}
