//
//  ProgressFragment.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 14/05/2023.
//

import UIKit

class ProgressFragment: UIView, Nibable {

    private var duration: Double!
    
    @IBOutlet var view: UIView!
    @IBOutlet weak var animatedView: UIView!
    @IBOutlet weak var bottomView: UIView!
    @IBOutlet weak var animatedViewWidth: NSLayoutConstraint!
    
    init(duration: Double) {
        super.init(frame: .zero)
        setupView(bundle: .main)
        self.duration = duration
        animatedView.layer.cornerRadius = 2
        bottomView.layer.cornerRadius = 2
        clearProgress()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func startProgress() {
        clearProgress()
        layoutIfNeeded()
        fill()
        UIView.animate(withDuration: duration) {[unowned self] in
            self.layoutIfNeeded()
        }
    }
    
    func fill() {
        animatedViewWidth.constant = bottomView.frame.width
        animatedView.layer.removeAllAnimations()
    }
    
    func clearProgress() {
        animatedViewWidth.constant = 0
        animatedView.layer.removeAllAnimations()
    }
}
