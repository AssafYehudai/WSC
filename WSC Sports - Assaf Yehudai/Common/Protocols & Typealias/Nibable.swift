//
//  Nibable.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 14/05/2023.
//

import Foundation
import UIKit

public protocol Nibable where Self: UIView {

    var view: UIView! { get set }
    var nibName: String { get }

    func setupView(bundle: Bundle?)
}

public extension Nibable {

    var nibName: String {
        get { String(describing: type(of: self)) }
    }

    func setupView(bundle: Bundle?) {
        view = loadViewFromNib(bundle: bundle)
        view?.frame = bounds
        view?.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }

    private func loadViewFromNib(bundle: Bundle?) -> UIView? {
        let nib = UINib(nibName: nibName, bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        return view
    }
}
