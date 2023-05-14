//
//  StoryScreen.swift
//  WSC Sports - Assaf Yehudai
//
//  Created by assaf yehudai on 13/05/2023.
//

import UIKit
import Combine

class StoryScreen: UIViewController {
    
    // MARK: - Subscriptions
    private var subsciptions = Set<AnyCancellable>()

    // MARK: - Properties
    private var viewModel: StoryScreenViewModel!
    
    // MARK: - IBOulets
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var progressBar: StoryProgressBar!
    @IBOutlet weak var playerView: StoryPlayer!
    
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
        
        let playerViewModel = StoryPlayerViewModel(pages: viewModel.getPages())
        playerViewModel.$currentPageIndex
            .receive(on: DispatchQueue.main)
            .sink {[weak self] index in
                self?.progressBar.currentIndex = index ?? 0
            }.store(in: &subsciptions)
        playerView.setup(viewModel: playerViewModel)
        progressBar.setupFragments(for: viewModel.getDurations())
    }
    
    // MARK: - IBActions
    @IBAction func didTapDismiss(_ sender: Any) {
        dismiss(animated: true)
    }
}
