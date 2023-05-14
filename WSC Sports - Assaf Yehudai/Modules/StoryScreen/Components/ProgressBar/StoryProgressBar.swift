//
//  StoryProgressBar.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 14/05/2023.
//

import UIKit

class StoryProgressBar: UIStackView {
    
    private var durationsArray = [Double]()
    var currentIndex: Int! {
        didSet {
            (subviews[currentIndex] as? ProgressFragment)?.startProgress()
            if (currentIndex != durationsArray.count - 1) {
                (subviews[currentIndex + 1] as? ProgressFragment)?.clearProgress()
            }
            if currentIndex != 0 {
                (subviews[currentIndex - 1] as? ProgressFragment)?.fill()
            }
        }
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func setupFragments(for array: [Double]?) {
        guard let array = array else { return }
        durationsArray = array
        array.forEach { addArrangedSubview(ProgressFragment(duration: $0)) }
    }
}


