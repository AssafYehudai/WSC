//
//  MatchesScreen.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 09/05/2023.
//

import UIKit

class MatchesScreen: UIViewController {
    
    // MARK: - Properties
    private var viewModel: MatchesScreenViewModel?
    
    // MARK: - Constructor
    init(viewModel: MatchesScreenViewModel) {
        super.init(nibName: "MatchesScreen", bundle: nil)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
