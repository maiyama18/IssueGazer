//
//  SettingsViewController.swift
//  IssueGazer
//
//  Created by maiyama on 2022/03/05.
//

import UIKit
import Extensions
import Resources

public final class SettingsViewController: UIViewController {
    private let viewModel: SettingsViewModel
    private let router: SettingsRouter

    public init(
        viewModel: SettingsViewModel = SettingsViewModel(),
        router: SettingsRouter = SettingsRouter()
    ) {
        self.viewModel = viewModel
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public override func viewDidLoad() {
        super.viewDidLoad()
        
        hostSwiftUIView(SettingsView(viewModel: viewModel))
        navigationItem.title = L10n.Settings.title
    }
}
