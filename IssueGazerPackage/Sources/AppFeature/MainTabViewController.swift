//
//  MainTabViewContorller.swift
//  AppFeature
//
//  Created by maiyama on 2022/03/05.
//

import UIKit
import Resources
import SettingsFeature

public final class MainTabViewController: UITabBarController {
    enum Tab: Int {
        case settings
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViewControllers()
    }
    
    private func setupViewControllers() {
        let settings = UINavigationController(rootViewController: SettingsViewController())
        settings.tabBarItem = UITabBarItem(
            title: L10n.Settings.title, image: UIImage(systemName: "gearshape"), tag: Tab.settings.rawValue)

        viewControllers = [settings]
        selectedIndex = Tab.settings.rawValue
    }
}
