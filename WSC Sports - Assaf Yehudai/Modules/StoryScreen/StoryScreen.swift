//
//  StoryScreen.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit

class StoryScreen: UIViewController {

    // MARK: - Properties
    private var viewModel: StoryScreenViewModel!
    
    // MARK: - IBOulets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var playerView: StoryPlayerView!
    
    // MARK: - Constructor
    init(viewModel: StoryScreenViewModel) {
        super.init(nibName: "StoryScreen", bundle: .main)
        self.viewModel = viewModel
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.setTitle("", for: .normal)
        playerView.loadPages(pages: viewModel.getPages())
    }
    
    // MARK: - IBActions
    @IBAction func didTapDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
