//
//  UIView+Extension.swift
//  Extensions
//
//  Created by maiyama on 2022/03/05.
//

import UIKit

extension UIView {
    public func pinEdgesToSuperview() {
        guard let view = superview else { return }

        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topAnchor.constraint(equalTo: view.topAnchor),
            leftAnchor.constraint(equalTo: view.leftAnchor),
            rightAnchor.constraint(equalTo: view.rightAnchor),
            bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
