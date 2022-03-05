//
//  QueriesViewController.swift
//  QueriesFeature
//
//  Created by maiyama on 2022/03/05.
//

import Extensions
import Resources
import UIKit

public final class QueriesViewController: UIViewController {
    private let viewModel: QueriesViewModel
    private let router: QueriesRouter

    public init(
        viewModel: QueriesViewModel = QueriesViewModel(),
        router: QueriesRouter = QueriesRouter()
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

        hostSwiftUIView(QueriesView(viewModel: viewModel))
        navigationItem.title = L10n.Queries.title
    }
}
